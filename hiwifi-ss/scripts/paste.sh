#API_DEV_KEY='263af8da7a1e1ec590979086e3c4a3a3'; # your api_developer_key
API_DEV_KEY=$3; # your api_developer_key
PRIVATE='1'; # 0=public 1=unlisted 2=private
NAME=$1; # name or title of your paste
EXPIRE_DATE='10M';
FORMAT=$2;
API_USER_KEY='snvosdbvsiugfe7fc8vw8w36d'; #if an invalid api_user_key or no key is used, the paste will be create as a guest
INPUT=$(cat $4)

url='http://pastebin.com/api/api_post.php'
query='api_option=paste&api_dev_key='${API_DEV_KEY}'&api_user_key='${API_USER_KEY}'&api_paste_expire_date='${EXPIRE_DATE}'&api_paste_private='${PRIVATE}'&api_paste_code='${INPUT}'&api_paste_name='${NAME}${FORMAT}

echo $query > query.txt
echo ''
echo '[Usage]: '$0' <name> <format> <API key> <File>'

echo ''
echo '[INFO]: Response from Pastebin:'
echo ''
echo '+++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo ''
curl -d @query.txt $url 2>/dev/null | cut -d '%' -f1
echo ''
echo '+++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo ''
rm query.txt
