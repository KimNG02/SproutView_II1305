import React from "react";
import './styles/AboutUs.css';

// Define a list of team members
const teamMembers = [
  {
    name: "Fatima",
    role: "Chefen",
    imageUrl: "https://static.vecteezy.com/system/resources/previews/024/822/642/original/cute-cartoon-sunflower-isolated-on-transparent-background-ai-generated-digital-illustration-png.png",
  },
  {
    name: "Theodor",
    role: "Servern",
    imageUrl: "https://static.vecteezy.com/system/resources/previews/022/948/153/non_2x/cute-happy-blackberry-character-ai-generated-free-png.png",
  },
  {
    name: "Rut",
    role: "Designer",
    imageUrl: "https://static.vecteezy.com/system/resources/previews/025/037/881/non_2x/cute-watercolor-peony-flower-illustration-ai-generative-png.png",
  },
  {
    name: "Oscar",
    role: "Den super snälla, vackra och roliga",
    imageUrl: "https://i.pinimg.com/originals/70/5d/ee/705dee71a624137356a93efa53267977.png",
  },
  {
    name: "Kim",
    role: "Servern",
    imageUrl: "https://www.creativefabrica.com/wp-content/uploads/2020/09/28/cute-flower-kawaii-illustrations-Graphics-5731329-1-1-580x387.png",
  },
  {
    name: "Saina",
    role: "Servern",
    imageUrl: "https://static.vecteezy.com/system/resources/previews/026/793/223/original/cute-watermelon-watercolor-ai-generative-png.png",
  },
  {
    name: "Emil",
    role: "Servern",
    imageUrl: "https://cdn-icons-png.freepik.com/512/6813/6813248.png",
  },
  {
    name: "Isac",
    role: "Servern",
    imageUrl: "https://www.creativefabrica.com/wp-content/uploads/2021/02/14/Kawaii-Cute-Carrot-Vegetable-Graphics-8601699-1.png",
  },
  // Add more team members as needed
];

const AboutUs = () => {
  return (
    <div className="about-us-container">
      <h1>About Us</h1>
      <h2>Team Gulsparv</h2>
      <div className="team-members">
        {teamMembers.map((member, index) => (
          <div key={index} className="team-member">
            <img src={member.imageUrl} alt={member.name} className="profile-picture" />
            <h2>{member.name}</h2>
            <p>{member.role}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AboutUs;