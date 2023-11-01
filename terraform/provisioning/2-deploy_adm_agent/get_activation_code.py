import requests
import os

CUSTOMER_ID = os.environ['CUSTOMER_ID']
CLIENT_ID = os.environ['CLIENT_ID']
CLIENT_SECRET = os.environ['CLIENT_SECRET']

def get_token():
    token_url = 'https://api-us.cloud.com/cctrustoauth2/root/tokens/clients'
    response = requests.post(token_url, data={
        'grant_type': 'client_credentials',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
    })
    token = response.json()
    return token['access_token']

def get_session():
    session = requests.Session()
    session.headers.update({
        'Authorization': f'CwsAuthbearer={get_token()}',
        'isCloud': 'true'
    })
    return session

def get_activation_code():
    preauth_url = f'https://adm.cloud.com/massvc/{CUSTOMER_ID}/nitro/v2/config/trust_preauthtoken'
    response = get_session().get(preauth_url)
    print(response.json())

if __name__ == '__main__':
    get_activation_code()