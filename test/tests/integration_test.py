import requests

URL = "8346_fedorov_iv-app-1:5000"
FILEPATH = 'tests/'
FILENAME = 'test_file.txt'

class TestIntegration:
    def test_upload_download(self):
        with open(FILEPATH + FILENAME, 'rb') as file:
            content_original = file.read()

        with open(FILEPATH + FILENAME, 'rb') as file:
            requests.post(f'http://{URL}/upload', files={'file': file})

        download = requests.get(f'http://{URL}/download/{FILENAME}')
        content_downloaded = next(download.iter_content(1000))

        assert content_original == content_downloaded
