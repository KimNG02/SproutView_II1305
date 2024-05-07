import React, { useRef, useState } from "react";
import "./styles/Healthy.css";
import "./styles/Timeline.css";

function Healthy({ timelineData, selectedPlant, sproutImage, vegetativeImage, floweringImage, matureImage}) {
  const suggestionsRef = useRef(null);
  const [value, setValue] = useState(1);
  const [sprout, setSprout] = useState(true);
  const [vegetative, setVegetative] = useState(false);
  const [flowering, setFlowering] = useState(false);
  const [mature, setMature] = useState(false);

  const scrollToSuggestions = () => {
    suggestionsRef.current.scrollIntoView({ behavior: "smooth" });
  };

  const handleChange = (event, num = null) => {
    var valueHere = null;
    num ? valueHere = num : valueHere = parseInt(event.target.value)
    switch (valueHere) {
      case 1:
        setSprout(true);
        setVegetative(false);
        setFlowering(false);
        setMature(false);
        break;
      case 2:
          setSprout(false);
          setVegetative(true);
          setFlowering(false);
          setMature(false);
        break;
      case 3:
        setSprout(false);
        setVegetative(false);
        setFlowering(true);
        setMature(false);
        break;
      case 4:
        setSprout(false);
        setVegetative(false);
        setFlowering(false);
        setMature(true);
        break;
    
      default:
        break;
    }
    setValue(valueHere);
  };

  const incrementValue = (event) => {
    const newValue = Math.min(value + 1, 4);
    setValue(newValue);
    handleChange(event, newValue);
  };
  
  const decrementValue = (event) => {
    const newValue = Math.max(value - 1, 1);
    setValue(newValue);
    handleChange(event, newValue);
  };

  return (
    <div className="healthy-container">
      {timelineData ? (
        <div>
          <section className = "timeline-section" id="healthy-timeline">
            <h1 classname="growth-title">Healthy Growth</h1>

            <h4>
              Your {selectedPlant} plant will grow healthily in the following stages
            </h4>
            <div className="healthy-circle-container">
              <button className="arrow left-arrow" onClick={decrementValue}>
                &lt;
              </button>
                {sprout && sproutImage}
                {vegetative && vegetativeImage}
                {flowering && floweringImage}
                {mature && matureImage}
              {/* <img
                src="https://s3-alpha-sig.figma.com/img/f5fa/dea8/ae7a8dcc084c12df9e01036341062518?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VNxZyqfpWqjUdqFj3zNKZsDDFkwapTlVDHoghvHqxYDW-EtPL6xk64xrdGje0BGAfQyJGrHOlJHso6eNZWDFaxZBg3HdkgjfGCvX5XlJIouSKJv4x7Za~U9yYLP~9aIf2OMYapfAP~zzDlvqHVeEP39PEYE8k9CmfesFqUaqk~dMsyw-g2UxtBiUTPdXmqlZABAb~OtoF4Icf48QitOIvU0uZKGlLWkPqYuZcsX3qY6wOq3hP~d9ly9ILkGyqkk4Mk-oRpyVc0dvJr9ylvThsS~BoK-yNE8bbzByN3NttW052PzoRxCx0TmKBwqkweJEqmvNGrtBz07z2h~u6VCODQ__"
                alt="Healthy Plant"
              /> */}
              <button className="arrow right-arrow" onClick={incrementValue}>
                &gt;
              </button>
            </div>
            <div className="slider-container">
              <input
                type="range"
                min="1"
                max="4"
                value={value}
                className="slider"
                onChange={handleChange}
              />
              <div className="labels">
                <span className={value === 1 ? "active" : ""}>
                  Sprout in {timelineData.sproutTime}
                </span>
                <span className={value === 2 ? "active" : ""}>
                  Vegetative {timelineData.vegetativeTime}
                </span>
                <span className={value === 3 ? "active" : ""}>
                  Flowering {timelineData.floweringTime}
                </span>
                <span className={value === 4 ? "active" : ""}>
                  Mature/Ripe {timelineData.matureTime}
                </span>
              </div>
            </div>

            
            <div id="helpbuttoncontainer">
              <button id="helpbutton" onClick={scrollToSuggestions}>Tips!</button>
            </div>
          </section>
          <section
            ref={suggestionsRef}
            className="timeline-section"
            id="growth-suggestions"
          >
            <h1>Growth Suggestions</h1>
            <div className="white-rectangle">
              <div className="growth-suggestions">
                <div className="comment">
                  <strong>Light:</strong>
                  <span>{timelineData.lightComment}</span>
                </div>
                <div className="comment">
                  <strong>Water:</strong>
                  <span>{timelineData.waterComment}</span>
                </div>
                <div className="comment">
                  <strong>Pot Size:</strong>
                  <span>{timelineData.potSizeComment}</span>
                </div>
                <div className="comment">
                  <strong>Soil:</strong>
                  <span>{timelineData.soilComment}</span>
                </div>
                <div className="comment">
                  <strong>Plant Care:</strong>
                  <span>{timelineData.plantCareComment}</span>
                </div>
                {timelineData.phComment ? <div className="comment">
                  <strong>pH:</strong>
                  <span>{timelineData.phComment}</span>
                </div> : <div></div>}
                {timelineData.humidityComment ? <div className="comment">
                  <strong>Humidity:</strong>
                  <span>{timelineData.humidityComment}</span>
                </div> : <div></div>}
              </div>
            </div>
          </section>
        </div>
      ) : (
        <div className="loading-screen">
          <img
            className="loading-screen"
            src="https://img.pikbest.com/png-images/20190918/cartoon-snail-loading-loading-gif-animation_2734139.png!bw700"
          />
        </div>
      )}
    </div>
  );
}

export default Healthy;
