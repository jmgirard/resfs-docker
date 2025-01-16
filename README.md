## Initial Setup
- Sign up for a free developer [Doppler](https://doppler.com) account
- Sign in and go to Projects
- Create new project called `resfs`
- Go to Development > dev_personal > Secrets (tab)
- Click on Add Secret three times and add:
    + `PASSWORD` (string) | `<type-rstudio-password-here>`
    + `SMB_USER` (string) | `<type-resfs-username-here>`
    + `SMB_PASS` (string) | `<type-resfs-password-here>`
- Click Save

## New Computer Setup
- Clone repo locally
    + Open powershell
    + Navigate to github folder via `cd F:/github`
    + Clone the repo via `git clone https://github.com/jmgirard/resfs-docker.git`
- Add Doppler service token
    + Sign into Doppler.com account
    + Go to Projects > resfs > Development > dev_personal > Access (tab) > Service Tokens
    + Generate a service token (read only, no expiration) and copy it to clipboard
    + Create `.env` files in the subfolders containing: `DOPPLER_TOKEN=<paste-token-here>`

## Use
- Open powershell
- Navigate to repo folder via `cd F:/github/resfs-docker`
- Navigate to desired image via `cd bayes` or `cd whisper`
- Build the image via `docker-compose build`
- Run the image via `docker-compose up`
