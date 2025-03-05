<h2>1. Animation</h2>
<h3>Description</h3>
<p>The <strong>Animation</strong> module enhances the user experience by integrating smooth and engaging animations into the application.</p>

<h3>Features</h3>
<ul>
    <li><strong>Custom Animations</strong>: Implemented using Flutter’s built-in animation framework.</li>
    <li><strong>Implicit & Explicit Animations</strong>: Includes both simple implicit animations and complex explicit animations using AnimationController.</li>
    <li><strong>Hero Animations</strong>: Used for seamless transitions between screens.</li>
    <li><strong>Lottie Animations</strong>: Integrated Lottie for high-quality vector animations.</li>
    <li><strong>Performance Optimization</strong>: Ensured animations run smoothly with minimal performance overhead.</li>
</ul>

<h3>Dependencies Used</h3>
<ul>
    <li>flutter_animate</li>
    <li>lottie</li>
    <li>rive</li>
</ul>

<h2>2. Native Integration</h2>
<h3>Description</h3>
<p>The <strong>Native Integration</strong> module connects the Flutter application with native platform-specific functionalities.</p>

<h3>Features</h3>
<ul>
    <li><strong>Platform Channels</strong>: Used for communication between Flutter and native Android/iOS code.</li>
    <li><strong>Camera & Media Access</strong>: Integrated with native APIs for capturing photos, recording videos, and accessing media files.</li>
    <li><strong>Background Services</strong>: Implemented native background tasks such as location tracking and push notifications.</li>
    <li><strong>Hardware Access</strong>: Supports features like fingerprint authentication, sensors, and haptic feedback.</li>
</ul>

<h3>Dependencies Used</h3>
<ul>
    <li>flutter_local_notifications</li>
    <li>permission_handler</li>
    <li>geolocator</li>
</ul>

<h2>3. OAuth Feature</h2>
<h3>Description</h3>
<p>The <strong>OAuth Feature</strong> module implements secure authentication using OAuth, allowing users to log in via third-party providers.</p>

<h3>Features</h3>
<ul>
    <li><strong>OAuth2.0 Authentication</strong>: Implements industry-standard authentication via Google, Facebook, and Apple.</li>
    <li><strong>Secure Token Management</strong>: Uses secure storage for access tokens.</li>
    <li><strong>Auto Login</strong>: Supports session persistence and automatic login.</li>
    <li><strong>Logout & Token Revocation</strong>: Ensures users can safely log out and revoke access.</li>
</ul>

<h3>Dependencies Used</h3>
<ul>
    <li>firebase_auth</li>
    <li>google_sign_in</li>
    <li>flutter_facebook_auth</li>
</ul>

<h2>Installation & Setup</h2>
<h3>Prerequisites</h3>
<ul>
    <li>Ensure Flutter is installed and set up.</li>
    <li>Configure Firebase for OAuth authentication.</li>
    <li>Set up necessary platform-specific permissions for native integrations.</li>
</ul>

<h3>Running the Project</h3>
<ol>
    <li>Navigate to the project directory:
        <pre><code>cd E:/practice</code></pre>
    </li>
    <li>Install dependencies:
        <pre><code>flutter pub get</code></pre>
    </li>
    <li>Run the application:
        <pre><code>flutter run</code></pre>
    </li>
</ol>

<h2>About This Project</h2>
<p>This project is a demonstration of my skills in Flutter development, including animation, native integration, and authentication features.</p>
