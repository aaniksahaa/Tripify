import React from 'react';
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend,
  } from 'chart.js';
import { Bar } from 'react-chartjs-2';
ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
  );

const AdminPriceChart = ({got_data}) => {
    let L = []
    let D = []

    for(let x of got_data)
    {
        L.push(x.price_range)
        D.push(x.count)
    }
  const data = {
    labels: L,
    datasets: [
      {
        label: 'Price Per Day',
        data: D,
        backgroundColor: '#41fdfe'
      }
    ]
  };

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: false,
        text: 'Chart.js Bar Chart',
      },
    },
  };

  return (
    <div>
      <Bar options={options} data={data} />
    </div>
  );
};

export default AdminPriceChart
