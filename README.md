# README

## Vapor game store

By: Mohammad Foroughi for COM2025 Coursework

## Requirements tested with

- Ruby: 3.0.3
- Rails: 6.1.4.1
- NodeJS: v12.22.7
- Yarn: 1.22.15

## Installation

Please make sure ruby and nodejs versions match requirements before running

- clone repo and cd to root
- run `yarn install`
- run `bundle install`
- run `rails db:setup` (just to be safe)
- run `rails s` for development server

## Troubleshooting

- If for any reason yarn could not be found install using: `npm install --global yarn`

- (Windows) If an error like this is encountered when doing `yarn install`:
  - > cannot be loaded because running scripts is disabled on this system
  - please try running this command in powershell as administrator: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

