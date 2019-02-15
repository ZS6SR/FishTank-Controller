var socket = io.connect('http://192.168.100.50:8080'); //connect to server
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	backgroundColor: "#F5DEB3",
	// The type of chart we want to create
	type: 'line',
	// The data for our dataset
	data: {
		labels: [],
		datasets: [{
			label: "Cl2",
			borderColor: "#217DBB",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#3498DB',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "NO3",
			borderColor: "#ffd24c",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#ffe599',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "NO2",
			borderColor: "#ff4c4d",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#ff9999',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "GH",
			borderColor: "#00d9d9",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#99ffff',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "KH",
			borderColor: "#a300d9",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#ff99ff',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "pH",
			borderColor: "#d9a300",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#ffe599',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}, {
			label: "Temp at Reading",
			borderColor: "#00b300",
			data: [],
			fill: false,
			pointStyle: 'circle',
			backgroundColor: '#b3ff99',
			pointRadius: 5,
			pointHoverRadius: 7,
			lineTension: 0,
		}]
	},
	// Configuration options go here
	options: {
		responsive: true,
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero:true
				}
			}]
		}
	}
});

socket.on ('waterParams', function(rows){
	for (var i=0; i<rows.length; i++) {
		chart.data.labels.push(rows[i].recordDate);
		chart.data.datasets[0].data.push(rows[i].cl2);
		chart.data.datasets[1].data.push(rows[i].no3);
		chart.data.datasets[2].data.push(rows[i].no2);
		chart.data.datasets[3].data.push(rows[i].gh);
		chart.data.datasets[4].data.push(rows[i].kh);
		chart.data.datasets[5].data.push(rows[i].ph);
		chart.data.datasets[6].data.push(rows[i].tempAtReading);
	}
	chart.update(); //Update the graph.
});