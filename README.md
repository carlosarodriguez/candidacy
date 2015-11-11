# Candidacy
The repository for the Candidacy iOS app made possible by @samguwang, @kevinavila and @carlosarodriguez

Contributions
- Carlos Rodriguez: Parse population, setup, and integration 
- Kevin Avila:
- Sam Wang: Polished UI, implemented webviews from Alamofire data returned from New York Times API. Modified Parse calls slightly to make it work.

Differences:
The main difference between the Alpha Version and the Beta version is the inclusion of the News feed. This was implemented using the New York Times API using AlamoFire and swiftyJSON. A big under-the-hood change includes the integration of the Parse MBAAS to store the candidate data (as opposed to being hardcoded like last time). Parse will be used in the Final version to store the poll data as well as the GoVote information. Additionally in the current version we have modified the images for candidates to be stored as URLS on Parse. Before the URLS, we tried to store the jpegs on Parse. We will try to directly grab jpegs in the next version if we find it better than the current version.
