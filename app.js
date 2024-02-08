var express = require('express');
var logger = require('morgan');
var path = require('path');
var cookieParser = require('cookie-parser');
var createError = require('http-errors');

var userRouter = require('./routes/users.routes');
var categoryRouter = require('./routes/category.routes');
var newsRouter = require('./routes/news.routes');
var hotRouter = require('./routes/hot.routes');

var app = express();

// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jade');

if(process.env.ENODE_ENV==='production') {
    app.use(logger('combined'))
  } else{
    app.use(logger('dev'))
}
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
//app.use(express.static(path.join(__dirname, 'public/images')));

app.use('/user', userRouter);
app.use('/category', categoryRouter);
app.use('/news', newsRouter);
app.use('/hot', hotRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    const logger = require('./config/logger')

    // render the error page
    res.status(err.status || 500);
    logger.error(
      'Server error' +
      '\n \t' + res.locals.error
    )
    res.send({"Message" : "실패", "Status" : 500, "Error" : res.locals.error});
});

// port open -> 왜 www 에서는 안되는지 모르겠다
// port open port open port open
app.listen(3000, () => {
    console.log("3000 port open");
});

module.exports = app;