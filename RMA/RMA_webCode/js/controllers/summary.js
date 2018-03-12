/**
 * Created by jinzhong.zheng on 2016/4/7.
 */
app.controller("SummaryController", ["$scope","Summary","$window", function($scope, summary, $window){
    var placeholder = {region_id:0, region_name: '请选择...'};
    $scope.productTypesLocal = angular.copy( $scope.productTypes);
    $scope.applyReasonsLocal = angular.copy($scope.applyReasons);
    $scope.phasesLocal = angular.copy($scope.phases);
    $scope.applyTypesLocal = angular.copy($scope.applyTypes);
    $scope.unitsLocal = angular.copy($scope.units);

    $scope.productTypesLocal.push($scope.shortph);
    $scope.applyReasonsLocal.push($scope.shortph);
    $scope.phasesLocal.push($scope.shortph);
    $scope.applyTypesLocal.push($scope.shortph);
    $scope.unitsLocal.push($scope.shortph);

    var colorOption =  [
        '#7266ba',//primary:
        '#23b7e5',// info:
        '#27c24c',//success:
        '#fad733',//warning:
        '#f05050',//danger:
        '#e8eff0',//light:
        '#3a3f51',//dark:
        '#1c2b36'//black:
    ];
    var summaryType = {
        stat_bill_num: 'APPLYSUMMARY',
        stat_bill_query: 'APPLYQUERY',
        stat_bill_overtime: 'EXPIRE',
        stat_repair_return: 'REOPEN',
        stat_refund_amount: 'REFUND',
        stat_return_reason: 'REASON',
        stat_cs_workload: 'CSWORKLOAD',
        stat_check_workload: 'CHECKWORKLOAD',
        stat_repair_workload: 'REPAIRWORKLOAD'
    };
    var summaryargs = null;
    $scope.canExport = false;
    $scope.provinces = [];
    $scope.counties = [];
    $scope.cities = [];
    $scope.labels = ['单据号','申请类型','商品类型','商品编号',
        '客户姓名','联系方式','购买时间','省份','城市','区域','当前阶段'];

    $scope.summaryArgs = {
        timeUnit: 'MONTH',
        productType: $scope.shortph,
        reason: $scope.shortph,
        phase: $scope.shortph,
        applyType: $scope.shortph,
        unit: $scope.shortph,
    };

    summary.getRegion(1).then(function(response){
        $scope.provinces = response.data.data;
        $scope.provinces.push(placeholder);
        $scope.summaryArgs.province = placeholder;
        $scope.getCity();
    });

    var chartDataFormat = function(data, nosum) {
        var retdata = {};
        var heads = data.headDatas;
        var bodys = data.bodyDatas;
        var ticks = [];
        var chart = [];
        var allsum = 0;
        for(var i=0; i<heads.length; i=i+1){
            var temptick = [];
            temptick.push(i+1);
            temptick.push(heads[i]);
            ticks.push(temptick);
        }
        for(var k=0; k<bodys.length; k=k+1){
            var tempchart = {};
            tempchart.label = bodys[k].rowName;
            var chartdata = [];
            var rowdata = bodys[k].rowData;
            var horizonsum = 0;
            for(var j=0; j<rowdata.length; j=j+1){
                var tempdata = [];
                tempdata.push(j+1);
                tempdata.push(rowdata[j]);
                horizonsum = horizonsum + rowdata[j];
                allsum = allsum + rowdata[j];
                chartdata.push(tempdata);
            }
            tempchart.data = chartdata;
            tempchart.hsummary = horizonsum;
            chart.push(tempchart);
        }
        retdata.ticks = ticks;
        retdata.chart = chart;
        retdata.all = allsum;
        return retdata;
    };
    var showChart = function(data) {
        var chartdata = data.chart;
        var barchartdata = [];
        var linechartdata = [];
        var piechartdata = [];
        var colors = [];
        var allsum = data.all;
        for(var i=0; i<chartdata.length-1; i=i+1){
            barchartdata.push({ label: chartdata[i].label, data: chartdata[i].data});
            linechartdata.push({ label: chartdata[i].label, data: chartdata[i].data, points: { show: true, radius: 2}, splines: { show: true, tension: 0, lineWidth: 3, fill: 0 }});
            piechartdata.push({ label: chartdata[i].label, data: (chartdata[i].hsummary/allsum)*100 });
            colors.push(colorOption[i]);
        }
        var barchartoption = {
            bars: { show: true, fill: true, lineWidth: 1, order: 1,barWidth: 0.1, fillColor: { colors: [{ opacity: 0.5 }, { opacity: 0.9}] } },
            colors: colors,
            series: { shadowSize: 1 },
            xaxis:{
                font: { color: 'black' },
                ticks: data.ticks
            },
            yaxis:{ font: { color: 'black' } },
            grid: { hoverable: true, clickable: true, borderWidth: 0, color: '#ccc' },
            tooltip: true,
            tooltipOpts: { content: '%y.0',  defaultTheme: false, shifts: { x: 0, y: 10 } }
        };
        var piechartoption = {
            series: { pie: { show: true, innerRadius: 0.5, stroke: { width: 0 }, label: { show: true, threshold: 0.05 } } },
            colors: colors,
            grid: { hoverable: true, clickable: true, borderWidth: 0, color: '#ccc' },
            //tooltip: true,
            //tooltipOpts: { content: '%y.0',  defaultTheme: false, shifts: { x: 0, y: 10 } }
        };

        var linechartoption = {
            colors: colors,
            series: { shadowSize: 3 },
            xaxis:{
                font: { color: '#black' },
                position: 'bottom',
                ticks: data.ticks
            },
            yaxis:{ font: { color: '#black' } },
            grid: { hoverable: true, clickable: true, borderWidth: 0, color: '#ccc' },
            tooltip: true,
            tooltipOpts: { content: '%y.0',  defaultTheme: false, shifts: { x: 0, y: 10 } }
        };

        jQuery.plot(jQuery('#barchart'),barchartdata, barchartoption);
        jQuery.plot(jQuery('#piechart'),piechartdata, piechartoption);
        jQuery.plot(jQuery('#linechart'),linechartdata, linechartoption);
    };
    var isEmpty = function(param){
        if(param === null || param === undefined || param === ' '){
            return true;
        }
        return false;
    };
    var gatLastDay = function(date){
        var year = date.getYear();
        var month = date.getMonth();
        month++
        if(month > 12){
            month = month - 12;
            year = year + 1;
        }
        var newDate = new Date(year, month, 1);
        return new Date(newDate.getTime() - 1);
    };
    $scope.getCity = function(){
        var parentId = $scope.summaryArgs.province.region_id;
        if(parentId === 0){
            $scope.cities = [];
            $scope.cities.push(placeholder);
            $scope.summaryArgs.city = placeholder;
            $scope.getCounty();
            return;
        }
        summary.getRegion(parentId)
            .then(function(response){
                $scope.cities = response.data.data;
                $scope.cities.push(placeholder);
                $scope.summaryArgs.city = placeholder;
                $scope.getCounty();
        });
    };
    $scope.getCounty = function(){
        var parentId = $scope.summaryArgs.city.region_id;
        if(parentId === 0){
            $scope.counties = [];
            $scope.counties.push(placeholder);
            $scope.summaryArgs.county = placeholder;
            return;
        }
        summary.getRegion(parentId)
            .then(function(response){
                $scope.counties = response.data.data;
                $scope.counties.push(placeholder);
                $scope.summaryArgs.county = placeholder;
            });
    };

    $scope.$on('navchange', function(event, data){
        $scope.rowData = null;
        $scope.data = null;
        $scope.canExport = false;
        showChart({ticks:[], chart:[{data:[],label:'',hsummary:0}],all:0});
    });
    $scope.dateformat = 'yyyy-MM-dd';
    $scope.summary = function($valid) {
        if(!$valid) return;
        summaryargs = angular.copy($scope.summaryArgs);
        if(isEmpty(summaryargs.startTime)|| isEmpty(summaryargs.endTime)){
            toast('error', '', '请输入开始时间和结束时间');
            return;
        }
        summaryargs.type = summaryType[$scope.selectedMenu.navbar_name];
        if(summaryargs.startTime > summaryargs.endTime){
            toast('error', '', '开始时间需小于结束时间', null);
            return false;
        }
        summaryargs.endTime.setHours(23);
        summaryargs.endTime.setMinutes(59);
        summaryargs.endTime.setSeconds(59);

        if(summaryargs.timeUnit == 'DAY' &&
            (summaryargs.endTime - summaryargs.startTime > 2678399000)){
            toast('error', '', '时间跨度不能超过31天', null);
            return false;
        }
        if(summaryargs.timeUnit == 'MONTH'){
            if(summaryargs.startTime.getDate() != 1 ||
                summaryargs.endTime.getDate() != gatLastDay(summaryargs.endTime).getDate()){
                toast('error', '', '开始时间为该月的第一天，结束时间为该月的最后一天', null);
                return false;
            }
            if(summaryargs.endTime - summaryargs.startTime > 32918399000){
                toast('error', '', '时间跨度不能超过12个月', null);
                return false;
            }
        }
        if(summaryargs.timeUnit == 'YEAR'){
            if(summaryargs.startTime.getMonth() != 0 || summaryargs.startTime.getDate() != 1 ||
                summaryargs.endTime.getMonth() != 11 || summaryargs.endTime.getDate() != gatLastDay(summaryargs.endTime).getDate()){
                toast('error', '', '开始时间为该年的第一天，结束时间为该年的最后一天', null);
                return false;
            }
            if(summaryargs.endTime - summaryargs.startTime > 820540799000) {
                toast('error', '', '时间跨度不能超过25个年', null);
                return false;
            }
        }

        summary.getSummaryResult(summaryargs).then(function(response){
            var data = response.data.data;
            $scope.rowData = data;
            $scope.data = chartDataFormat($scope.rowData);
            showChart($scope.data);
            if($scope.data.all === 0){
                toast('error', '没有符合条件的数据');
                $scope.canExport = false;
                return;
            }
            $scope.canExport = true;
            //showChart($scope.data);
        });
    };

    $scope.export = function(){
        summary.exportSummaryResult(summaryargs);
    };
    $scope.query = function($valid) {
        if(!$valid) return;
        $scope.summaryArgs.type = summaryType[$scope.selectedMenu.navbar_name];
        summaryargs = angular.copy($scope.summaryArgs);
        if(!isEmpty(summaryargs.endTime) && !isEmpty(summaryargs.startTime)){
            if(summaryargs.startTime > summaryargs.endTime){
                toast('error', '', '开始时间需小于结束时间', null);
                return false;
            }
            summaryargs.endTime.setHours(23);
            summaryargs.endTime.setMinutes(59);
            summaryargs.endTime.setSeconds(59);
        }
        summary.getSummaryResult(summaryargs).then(function(response){
            var data = response.data.data;
            $scope.tdatas = data;
            if($scope.tdatas === null || $scope.tdatas.length === 0){
                toast('error', '没有符合条件的数据');
                $scope.canExport = false;
                return;
            }
            $scope.canExport = true;
        });
    };
    $scope.getSummaryDetail = function(index, label) {
        var datas = $scope.rowData.bodyDatas;
        var ids = null;
        angular.forEach(datas, function(data){
            if(data.rowName === label){
                ids = data.extras[index];
            }
        });
        summary.getSummaryDetail(ids).then(function(response){
            $scope.requerydata = [];
            $scope.requerydata = response.data.data;
        });
    }

}]);