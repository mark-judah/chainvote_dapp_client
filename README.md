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
    <pre><code>git clone https://github.com/mark-judah/chainvote_dapp_client.git</code></pre>
  </li>
  <li>Navigate to the project directory:
    <pre><code>cd chainvote_dapp_client</code></pre>
  </li>
  <li>Run the Flutter project setup:
    <pre><code>flutter pub get</code></pre>
  </li>
</ol>

<h3>Setting up Twilio for OTP</h3>
<p>Sign up for a Twilio account at <a href="https://www.twilio.com/console" target="_blank">Twilio Console</a>.</p>

<p>Retrieve your Account SID and Auth Token from the Twilio dashboard.</p>

<p>Replace the placeholders in the Flutter project:</p>
<ol>
  <li>Open the file containing Twilio details (<em>login_bloc.dart</em>).</li>
  <li>Update the following lines with your Twilio credentials:</li>
</ol>
<pre><code>
final String accountSid = "YOUR_ACCOUNT_SID";
final String authToken = "YOUR_AUTH_TOKEN";
final String twilioNumber = "YOUR_TWILIO_NUMBER";
</code></pre>

<h3>Linking to the Backend</h3>
<p>This project works with https://github.com/mark-judah/voting_dapp_project, clone and follow the instructions in the readme to setup and run the backend. The default is 127.0.0.1:3500</p>

<p>Open the Flutter project and locate the <em>global_variables.dart</em> file.</p>

<p>Update the <code>urlPrefix</code> variable with the backend URL:</p>
<pre><code>
static var urlPrefix = "YOUR_BACKEND_URL";
</code></pre>

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
