import React, { useState } from 'react';
import ReactDOM from 'react-dom/client';
import { createHashRouter, RouterProvider } from "react-router-dom";
import './styles/index.css';
import App from './App';
import Options from './Options';
import Timeline from './Timeline';
import AboutUs from './AboutUs';
import Toolbar from './Toolbar';
import Healthy from './Healthy';
import Risky from './Risky';
import Dead from './Dead';

const Root = () => {
  const [selectedPlant, setSelectedPlant] = useState(null);
  const [optionsObj, setOptionsObj] = useState({
    plant: "",
    season: "",
    potsize: "",
    soiltype: "",
    water: "",
    light: "",
  });

  const handleSelectedPlant = (plant) => {
    setSelectedPlant(plant)
  }

  

  const handleOptionsObject = (plant, season, potsize, soiltype, water, light) => {
    setOptionsObj(({
      ...optionsObj,
      plant: plant,
      season: season,
      potsize: potsize,
      soiltype: soiltype,
      water: water,
      light: light,
      }
    ));
    //console.log(JSON.stringify(optionsObj));
    //console.log(optionsObj.plant, optionsObj.climate);
  };

  return (
    <React.StrictMode>
        <Toolbar />
        <RouterProvider router={makeRouter({
          selectedPlant, handleSelectedPlant, 
          handleOptionsObject, optionsObj})}/>
    </React.StrictMode>
  );
};
function makeRouter 
({selectedPlant, handleSelectedPlant, handleOptionsObject, optionsObj}) {
  return createHashRouter([
    {
      path: "/",
      element: <App 
      selectedPlant={selectedPlant} 
      onPlantChange={handleSelectedPlant}/>
    },
    {
      path: "/options",
      element: <Options selectedPlant={selectedPlant} handleOptionsObject={handleOptionsObject} />
    },
    {
      path: "/timeline",
      element: <Timeline optionsObj={optionsObj}/>
    },
    {
      path: "/aboutus",
      element: <AboutUs />
    },
    {
      path: "/healthy",
      element: <Healthy />
    },
    {
      path: "/risky",
      element: <Risky />
    },
    {
      path: "/dead",
      element: <Dead />
    },
  ])
}

ReactDOM.createRoot(document.getElementById('root')).render(<Root />);
