$(function () {
    console.log("content-list script 시작");
    $('.neighbor').on('click', e => {
        console.log("neighbor 클릭이벤트!");
        location.href =
            "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'NEIGHBOR')}";
    })
    $('.issue').on('click', e => {
        console.log("issue 클릭이벤트!");
        console.log(e.target);
        location.href =
            "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'ISSUE')}";
    });
    $('.daily').on('click', e => {
        console.log("daily 클릭이벤트!");
        console.log(e.target);
        location.href =
            "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'DAILYLIFE')}";
    });
    $('.notice').on('click', e => {
        console.log("notice 클릭이벤트!");
        console.log(e.target);
        location.href =
            "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'NOTICE')}";
    });
    $('.etc').on('click', e => {
        console.log("etc 클릭이벤트!");
        console.log(e.target);
        location.href =
            "/nboard/list${pageMaker.makeParam(pageMaker.criteria.page, pageMaker.criteria.amount, 'ETC')}";
    });
});