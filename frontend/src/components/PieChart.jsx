import React from 'react';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';

ChartJS.register(ArcElement, Tooltip);


const PieChart = () => {
  const data = {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    datasets: [
      {
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: [
          'red',
          'blue',
          'yellow',
          'green',
          'purple',
          'orange'
        ]
      }
    ]
  };

  return (
    <div>
      <h2>Pie Chart Example</h2>
      <Pie width={100} height={100} data={data} />
    </div>
  );
};

export default PieChart;
