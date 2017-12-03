var chart;

function grafico(event){
	// Build the chart
	chart = new Highcharts.Chart({
        chart: {
        	renderTo: 'container',
        	type: 'pie',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: 'Itens mais vendidos'
        },
        tooltip: {
    	    pointFormat: '{series.descricao}: <b>{point.percentage:.1f}%</b> Produto mais vendido'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
		series: [{
	    	

			data: busca()
		}]
    });
}

function busca(){
	
	$.getJSON(
		'/administrador/grafico', 
		function(data) {
			console.log(data);
			chart.series[0].setData(data);
		}
	);
}


