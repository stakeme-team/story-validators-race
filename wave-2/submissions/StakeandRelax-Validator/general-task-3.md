A docker compose repository with some usefull script to

- Install All + Service + Start (allow to delete all the containers before all)
- Create only service
- Delete service
- Delete all the containers (useful for configuration changes)

- https://github.com/StakeandRelax-Validator/story-wave-2/tree/main/monitoring

- Embedded there are 3 dashboars:
- - geth dashoboard (user needs to enable metrics on geth service)
  - node_exporter dashboard
  - story dashboard (based on tendermint, user need to enable prometheua on .story/story/config/config.toml)
