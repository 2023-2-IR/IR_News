#!/usr/bin/env python
# coding: utf-8

# In[54]:


from konlpy.tag import Kkma
import requests
from bs4 import BeautifulSoup
from datetime import datetime
from typing import List
from textrankr import TextRank
from konlpy.tag import Okt
import collections
from pytz import timezone
import traceback
import csv
import pandas as pd
from soynlp.tokenizer import LTokenizer
from soynlp.word import WordExtractor
from soynlp import DoublespaceLineCorpus
import urllib.request
import pymysql


#키워드 학습
urllib.request.urlretrieve("https://raw.githubusercontent.com/lovit/soynlp/master/tutorials/2016-10-20.txt", filename="keyword.txt")
corpus = DoublespaceLineCorpus("keyword.txt")
word_extractor = WordExtractor()
word_extractor.train(corpus)
word_score_table = word_extractor.extract()
scores = {word:score.cohesion_forward for word, score in word_score_table.items()}
l_tokenizer = LTokenizer(scores=scores)

today = datetime.now(timezone('Asia/Seoul'))

class OktTokenizer:
    okt: Okt = Okt()

    def __call__(self, text: str) -> List[str]:
        tokens: List[str] = self.okt.phrases(text)
        return tokens

mytokenizer: OktTokenizer = OktTokenizer()
textrank: TextRank = TextRank(mytokenizer)

kkma = Kkma()

words=[]
Data1=[]
Data2=[]
last_Data=[]
many=[]

#분야 함수
def department(num,key):
  if(num == 1):
    if(key == 1):
      depart = "politics"
      category = "1"
      return (depart,category)
    elif(key == 2):
      depart = "money"
      category = "2"
      return (depart,category)
    elif(key == 3):
      depart = "society"
      category = "3"
      return (depart,category)
    elif(key == 4):
      depart = "sports"
      category = "5"
      return (depart,category)
    elif(key == 5):
        depart = "world"
        category = "6"
        return (depart,category)
    elif(key == 6):
        depart = "culture"
        category = "4"
        return (depart,category)
  elif(num == 2):
    if(key == 1):
      depart = "Politics"
      category = "1"
      return (depart,category)
    elif(key == 2):
      depart = "Economy"
      category = "2"
      return (depart,category)
    elif(key == 3):
      depart = "Society"
      category = "3"
      return (depart,category)
    elif(key == 4):
      depart = "Sports"
      category = "5"
      return (depart,category)
    elif(key == 5):
      depart = "Inter"
      category = "6"
      return (depart,category)
    elif(key == 6):
      depart = "Culture"
      category = "4"
      return (depart,category)

#기사 스크랩 함수
def getNews():
  key = int(input("1:정치 2:경제 3:사회\n4:스포츠 5:국제 6:문화 \n"))
  for i in range(2):
    if(i == 0):
        depart,origin_category = department(1,key)
        soups = ".card"
        date = ".date"
        content = "#article_body"
        img = ".image"
    elif(i == 1):
        depart,origin_category = department(2,key)
        soups = ".articleList"
        img = ".thumb"
        date = ".date"
        content = ".article_txt"
    for j in range(1,4):
      if(i == 0):
        url = "https://www.joongang.co.kr/"+depart+"?page=" + str(j)
      elif(i == 1):
        k = (j-1)*10 + 1
        url = "https://www.donga.com/news/"+depart+"?p=" + str(k) + "&prod=news&ymd=&m="
      headers = {"User-Agent": "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36"}
      res = requests.get(url, headers=headers)
      soup = BeautifulSoup(res.text, 'lxml')
      #큰 덩어리
      newslist = soup.select(soups)
      for news in newslist:
        lis=news.findAll("div")
        #날짜
        for li in lis:
          box = li.select_one(date)
          if(box == None):
            pass
          else:
            #코드 가져와서 텍스트 형태로
            clean = box.text
            # print(clean[11:13])
            #현재 날짜와 기사 날짜가 같으면
            if(today.strftime("%Y-%m-%d") == clean[:10].replace(".","-")):
              if(int(datetime.now(timezone('Asia/Seoul')).hour) - int(clean[11:13]) < 8 ):
                #제목 있는 태그 선택
                list_title=li.select_one("a")
                #기사 제목 거르기
                if(list_title == None):
                  pass
                else:
                  #기사 제목
                  news_title = list_title.text.replace("\n","")
                  #기사 링크
                  news_link = list_title.get("href")
                  #기사 들어가서 내용
                  url = news_link
                  res = requests.get(url, headers=headers)
                  soup = BeautifulSoup(res.text, 'lxml')
                  news_contents = soup.select_one(content).text.replace("\n","").replace("\t","").replace("\r","")
                  k: int = 3  # 몇 줄로 요약할건지
                  summaries: List[str] = textrank.summarize(news_contents, k, verbose=False)
                  contents=''
                  for summary in summaries:
                    contents+=summary
                    contents+='. '
                  #이미지
                  image = soup.select(img)
                  try:
                    news_image = image[0].select_one("img").get("src")
                  except:
                    news_image = None
                  keywords = l_tokenizer.tokenize(news_title, flatten=False)
                  news_keyword=[]
                  for x,y in keywords:
                      news_keyword.append(x)
                  for q in news_keyword:
                    if(len(q) < 2):
                      news_keyword.remove(q)
                  if("속보" in news_title):
                    category = "0"
                  else:
                    category = origin_category
                  if(i == 0):
                    Data1.append({
                      'title' : news_title,
                      'link' : news_link,
                      'time' : clean[:13],
                      'img' : news_image,
                      'keyword' : news_keyword,
                      'content' : contents,
                      'category' : category
                    })
                  elif(i == 1):
                    Data2.append({
                      'title' : news_title,
                      'link' : news_link,
                      'time' : clean[:13],
                      'img' : news_image,
                      'keyword' : news_keyword,
                      'content' : contents,
                      'category' : category
                    })

#내용 요약 함수
def sum_contents():
  for i in range(len(Data2)):
    for j in Data2:
      result1 = Data1[i]['keyword']+j['keyword']
      long1 = len(result1)
      result2 = set(result1)
      long2 = len(result2)
      if(long1 - long2 > 4):
          print(Data1[i]['title'])
          print(Data1[i]['content'])
          print(j['title'])
          print(j['content'])
          print()
          k: int = 4  # 몇 줄로 요약할건지
          string = j['content']+Data2[i]['content']
          summaries: List[str] = textrank.summarize(string, k, verbose=False)
          # print("정리 : "+str(summaries))
          print()
          contents=''
          for summary in summaries:
            contents+=summary
            contents+='. '
          print(contents)
          last_Data.append({
          'title' : j['title'],
          'img' : j['img'],
          'keyword' : result2,
          'content' : contents,
          'category' : j['category']
        })
          continue
      else:
        last_Data.append({
            'title' : j['title'],
            'img' : j['img'],
            'keyword' : j['keyword'],
            'content' : j['content'],
            'category' : j['category']
        })

getNews()
try:
  sum_contents()
except Exception as e:
  print(e)
  print(traceback.format_exc())
  print('오류')
print(len(Data1))
print(len(Data2))
# for i in Data1:
#   print(i)
# print()
# print()
# for i in Data2:
#   print(i)
# print()
# print()

def combine_values(value):
    if all(isinstance(x, (int, float)) for x in value):
        return sum(value)
    elif all(isinstance(x, str) for x in value):
        return ''.join(value)
    else:
        # 다른 타입의 값이 있는 경우에 대한 처리
        return value

unique_dicts = [dict((k, combine_values(v)) for k, v in d.items()) for d in last_Data]
unique_dicts = [dict(t) for t in {tuple(sorted(d.items())) for d in unique_dicts}]

today = today.strftime("%Y-%m-%d %H:%M:%S")

data ={'title' : [],'img' : [], 'content' : [] ,'keyword' : [], 'category' : []}

print(today)
print()
print()
for i in unique_dicts:
  data['title'].append(i['title'])
  data['img'].append(i['img'])
  data['content'].append(i['content'])
  data['keyword'].append(i['keyword'])
  data['category'].append(i['category'])

df = pd.DataFrame(data)
df.set_index('title',inplace=True)
df.to_excel("./news.xlsx")
print(len(unique_dicts))

