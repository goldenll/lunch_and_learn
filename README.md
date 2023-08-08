<h1>Lunch and Learn</h1>
<h2>Project Description</h2>
You are a back-end developer working on a team that is building an application to search for cuisines by country, and provide opportunity to learn more about that countries culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.

<h2>Learning Goals</h2>
 - Expose an API that aggregates data from multiple external APIs
 - Expose an API that requires an authentication token
 - Implement Basic Authentication
 - Expose an API for CRUD functionality
 - Determine completion criteria based on the needs of other developers
 - Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

# Resources:
**Edamam API** key and application id: https://developer.edamam.com/edamam-recipe-api
 - API endpoint: "https://api.edamam.com/api/recipes/v2?type=public&q=#{country}"
<br>
**REST Countries API**: https://restcountries.com/#api-endpoints-v3-all (no API key required)<br>
 - API endpoint: "https://restcountries.com/v3.1/all"
<br>
**YouTube API** key: https://developer.edamam.com/edamam-recipe-api<br>
 - API endpoint: "https://www.googleapis.com/youtube/v3/search"
<br>
**YouTube API** key: https://unsplash.com/documentation#creating-a-developer-account<br>
 - API endpoint: "https://api.unsplash.com/search/photos"
