## ELANCE JobPortal (in development)
### RoR integrating Semantic-ui layouts and components.

### BACK 
- OpenVZ VPS 6GB (London)
- Debian 8.9
- Apache/2.4.10
- Phusion-Passenger 5.1.11
- mysql 14.14 Distrib 5.5.58, for debian-linux-gnu (x86_64) using readline 6.3
- ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
- rails 5.1.4
- rvm 1.29.3

### IDE
SmarTTY. WinSCP. SublimeText. UltraEdit. MySQL WorkBench 6.3. PhpMyAdmin. PhotoShop. ...

### FRONT 
gems: 'bcrypt', 'devise', 'semantic-ui-sass', ...

### Description
RoR Webportal integrating semantic-ui, initially based on: 
https://www.youtube.com/channel/UCB61JUulUDUhglJNFcLnRmA course 
and https://github.com/muhibbudins/moderns semantic-ui pages.

### Features (in development)
- User registration and login
- Blog
- TopNavBar
- About and initial pages
- Gigs, proposals and skills functionalities 

### Installation and configuration
1. Install RoR
2. Download and copy or replicate repository in a new folder (elance) of your workspace
3. Execute bundle install and bundle update
4. Create database and insert database.yml and secretes.yml in /config folder
5. Configure database.yml connection
6. Execute rails db:schema:load to build up database tables and associations.
- In principle this six steps will allow you to work on the website, creating new users and gigs.

### Live demo
http://185.117.22.166:8909/blog

### Contributing
#### Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request
