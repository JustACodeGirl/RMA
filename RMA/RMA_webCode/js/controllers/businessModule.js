/**
 * Created by nina.zheng on 2016/4/20.
 */
app.controller('businessController', ['$scope', 'system', '$filter', '$window', '$state',
  function ($scope, system, $filter, $window, $state) {
    $scope.tabs = [true, false, false, false];
    $scope.tab = function (index) {
      angular.forEach($scope.tabs, function (i, v) {
        $scope.tabs[v] = false;
      });
      $scope.tabs[index] = true;
    }
    var areaItemsCopy = null;
    var getPostage = function(){
      system.getpostage().success(function (response) {
        $scope.areaItems = response.data;
        areaItemsCopy = angular.copy($scope.areaItems);
      });
    }
    getPostage();
    $scope.savePostage = function (value) {
      var i = 0;
      value.provinces.forEach(function (data) {
        if ((typeof(data.subsidy) != "number") || (data.subsidy < 0)) {
          toast('error', '', '请输入正数');
          $scope.areaItems = angular.copy(areaItemsCopy);
        }else if(data.subsidy>100){
          toast('error', '', '请输入三位一下的正数');
        }else{
          i++;
        }
      });
      if(i == value.provinces.length){
        system.savepostage(value).then(function (response) {
          if (response.data.stateCode == 'SUCCESS') {
          }
        })
      }else{
        getPostage();
      }
    };
    var actDeftimeCopy = null;
    $scope.getActdeftime = function () {
      system.getactdeftime().success(function (response) {
        $scope.actDeftime = response.data;
        actDeftimeCopy = angular.copy($scope.actDeftime);
      });
    }
    $scope.saveActdeftime = function (actDeftime) {
      if ((typeof(actDeftime.warning_limit) != "number") || (typeof(actDeftime.dead_limit) != "number")) {
        toast('error', '', '请输入数字');
        $scope.actDeftime = angular.copy(actDeftimeCopy);
        return;
      }else if ((actDeftime.warning_limit < 0) || (actDeftime.dead_limit < 0)) {
        toast('error', '', '请输非负数字');
        $scope.actDeftime = angular.copy(actDeftimeCopy);
        return;
      }else if (actDeftime.warning_limit > actDeftime.dead_limit) {
        toast('error', '', '警告时间大于截止时间');
        $scope.actDeftime = angular.copy(actDeftimeCopy);
        return;
      }else if((actDeftime.warning_limit>120)||(actDeftime.dead_limit>120)){
        toast('error', '', '时间最大值为120小时');
        $scope.actDeftime = angular.copy(actDeftimeCopy);
        return;
      }

      var params = {
        act_def_id: actDeftime.act_def_id,
        limit: actDeftime.dead_limit * 3600,
        warning_limit: actDeftime.warning_limit * 3600
      }
      system.saveactdeftime(params).success(function (response) {
      });
    };

    var scheduleTimeCopy = null;
    $scope.getShedule = function () {
      system.getschedule().success(function (response) {
        $scope.scheduleTime = response.data;
        scheduleTimeCopy = angular.copy($scope.scheduleTime);
      });
    }

    $scope.saveSchedule = function () {
      var params = {
        am_start_time: $scope.scheduleTime.am_start_time,
        am_end_time: $scope.scheduleTime.am_end_time,
        pm_start_time: $scope.scheduleTime.pm_start_time,
        pm_end_time: $scope.scheduleTime.pm_end_time
      };
      var am_start_time_temp = $scope.scheduleTime.am_start_time;
      var am_end_time_temp = $scope.scheduleTime.am_end_time;
      var pm_start_time_temp = $scope.scheduleTime.pm_start_time;
      var pm_end_time_temp = $scope.scheduleTime.pm_end_time;
      var str =/^(\d{2}):(\d{2})$/;
      var r1 = $scope.scheduleTime.am_start_time.match(str);
      var r2 = $scope.scheduleTime.am_end_time.match(str);
      var r3 = $scope.scheduleTime.pm_start_time.match(str);
      var r4 = $scope.scheduleTime.pm_end_time.match(str);
     if((r1==null)||(r2==null)||(r3==null)||(r4==null)){
       toast('error', '', '输入时间格式有误，正确格式如：08:30');
       $scope.scheduleTime = angular.copy(scheduleTimeCopy);
     } else if ((am_start_time_temp.slice(3, 5) >= '60') || (am_end_time_temp.slice(3, 5) >= '60') ||
        (pm_start_time_temp.slice(3, 5) >= '60') || (pm_end_time_temp.slice(3, 5) >= '60')) {
        toast('error', '', '分钟小于60');
        $scope.scheduleTime = angular.copy(scheduleTimeCopy);
      }else if (am_end_time_temp.slice(0, 2) >= '12') {
        toast('error', '', '上午下班时间大于12点');
        $scope.scheduleTime = angular.copy(scheduleTimeCopy);
      }else if (am_start_time_temp >= am_end_time_temp) {
        toast('error', '', '上午上班时间应该早于下班时间');
        $scope.scheduleTime = angular.copy(scheduleTimeCopy);
      }else if (pm_start_time_temp.slice(0, 2) < '12') {
        toast('error', '', '下午上班时间小于12点');
        $scope.scheduleTime = angular.copy(scheduleTimeCopy);
      }else if (pm_end_time_temp <= pm_start_time_temp) {
        toast('error', '', '下午下班时间应该大于下午上班时间');
        $scope.scheduleTime = angular.copy(scheduleTimeCopy);
      }else{
       system.saveschedule(params).success(function (response) {
       })
     }

    };

    $scope.isShow = true;
    $scope.colors = [['bg-success bg'], ['bg-danger bg'],
      ['bg-warning bg'], ['bg-info bg'], ['bg-black-opacity bg'],
    ];
    $scope.festival = {};
    $scope.saveFestival = function (festival) {
      if (festival.start_date > festival.end_date) {
        toast('error', '', "开始日期大于结束日期", null);
        return;
      }
      jQuery('#addfestival').modal('hide');
      var params = {
        festival_name: festival.name,
        festival_start_date: $filter('date')(festival.start_date, 'yyyy-MM-dd HH:mm:ss'),
        festival_end_date: $filter('date')(festival.end_date.setHours(23, 59, 59), 'yyyy-MM-dd HH:mm:ss')
      };
      system.savefestival(params).success(function (response) {
        var newEvent = {
          id: response.data,
          title: params.festival_name,
          start: new Date(params.festival_start_date),
          end: new Date(params.festival_end_date),
          className: 'bg-success bg'
        };
        $scope.events.push(newEvent);
        $scope.festival = {};
      })
    };
    /*timepicker start*/
    $scope.mytime = new Date();

    $scope.hstep = 1;
    $scope.mstep = 15;

    $scope.options = {
      hstep: [1, 2, 3],
      mstep: [1, 5, 10, 15, 25, 30]
    };

    $scope.ismeridian = true;
    $scope.toggleMode = function () {
      $scope.ismeridian = !$scope.ismeridian;
    };

    $scope.update = function () {
      var d = new Date();
      d.setHours(14);
      d.setMinutes(0);
      $scope.mytime = d;
    };

    $scope.changed = function () {
      //console.log('Time changed to: ' + $scope.mytime);
    };

    $scope.clear = function () {
      $scope.mytime = null;
    };
    /*timepicker end*/

    $scope.eventSource = {
      url: "http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic",
      className: 'gcal-event',           // an option!
      currentTimezone: 'America/Chicago' // an option!
    };

    $scope.events = [];

    $scope.overlay = $('.fc-overlay');
    $scope.alertOnMouseOver = function (event, jsEvent, view) {
      $scope.event = event;
      $scope.overlay.removeClass('left right').find('.arrow').removeClass('left right top pull-up');
      var wrap = $(jsEvent.target).closest('.fc-event');
      var cal = wrap.closest('.calendar');
      var left = wrap.offset().left - cal.offset().left;
      var right = cal.width() - (wrap.offset().left - cal.offset().left + wrap.width());
      if (right > $scope.overlay.width()) {
        $scope.overlay.addClass('left').find('.arrow').addClass('left pull-up')
      } else if (left > $scope.overlay.width()) {
        $scope.overlay.addClass('right').find('.arrow').addClass('right pull-up');
      } else {
        $scope.overlay.find('.arrow').addClass('top');
      }
      (wrap.find('.fc-overlay').length == 0) && wrap.append($scope.overlay);
    }

    /* config object */
    $scope.uiConfig = {
      calendar: {
        height: 450,
        editable: true,
        header: {
          left: 'prev',
          center: 'title',
          right: 'next'
        },
        dayClick: $scope.alertOnEventClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventMouseover: $scope.alertOnMouseOver
      }
    };
    /* remove event */
    $scope.remove = function (index, festival_id) {
      system.deletefestival(festival_id).success(function (response) {
        $scope.events.splice(index, 1);
      });
    };
    /* Change View */
    $scope.today = function (calendar) {
      system.getfestival().success(function (response) {
        if ($scope.events.length >= response.data.length) {
          $scope.events.splice(0, response.data.length)
        }
        var i = 0;
        response.data.forEach(function (fest) {
          var event = {
            id: fest.festival_id,
            title: fest.festival_name,
            start: new Date(fest.festival_start_date),
            end: new Date(fest.festival_end_date).setHours(23, 59, 59),
            className: $scope.colors[i % 4]
          };
          i++;
          $scope.events.push(event);
        });
        jQuery('.calendar').fullCalendar('today');
      });
    };
    /* event sources array*/
    $scope.eventSources = [$scope.events];
    //$scope.isShowaddfestival = false;
    jQuery("#calendar").dblclick(function () {
      jQuery('#addfestival').modal('show');
    })
  }
]);

