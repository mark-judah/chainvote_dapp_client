<!DOCTYPE html>
<html>

<body>

<h1>ChainVote Frontend Client</h1>

<p>ChainVote Frontend is a Flutter-based client designed for voting. It allows voters to log in with an OTP and choose their preferred candidate. Administrators can configure the client based on geographical locations.</p>

<h2>Functionalities</h2>
<ul>
  <li><strong>Voter Login:</strong> Users can authenticate using an OTP.</li>
  <li><strong>Candidate Selection:</strong> Voters can choose their preferred candidate.</li>
</ul>

<h2>Administrator Configuration</h2>
<p>Administrators can configure the following geographical details:</p>
<ul>
  <li><strong>County:</strong> Set the county for the voting process.</li>
  <li><strong>Constituency:</strong> Define the constituency for the voting area.</li>
  <li><strong>Ward:</strong> Specify the ward for the voting region.</li>
  <li><strong>Polling Station:</strong> Set the specific polling station for voting.</li>
</ul>

<h2>Setup Instructions</h2>

<h3>Prerequisites</h3>
<ul>
  <li>Flutter SDK installed</li>
  <li>Linux desktop environment</li>
</ul>

<h3>Setting up Flutter Project</h3>
<ol>
  <li>Clone the ChainVote Frontend repository:
    <pre><code>git clone https://github.com/your-username/ChainVoteFrontend.git</code></pre>
  </li>
  <li>Navigate to the project directory:
    <pre><code>cd ChainVoteFrontend</code></pre>
  </li>
  <li>Run the Flutter project setup:
    <pre><code>flutter pub get</code></pre>
  </li>
</ol>

<h3>Setting up Twilio for OTP</h3>
<!-- Twilio setup details -->

<h3>Linking to the Backend</h3>
<!-- Backend URL configuration details -->

<h3>Running the Project on Linux</h3>
<ol>
  <li>Ensure you have the necessary Linux desktop-specific setup for Flutter.</li>
  <li>Run the Flutter project:
    <pre><code>flutter run -d linux</code></pre>
  </li>
  <li>The application should launch on your Linux desktop.</li>
</ol>
</body>
</html>
