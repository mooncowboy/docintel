from azure.ai.documentintelligence import DocumentIntelligenceClient
from azure.ai.documentintelligence.models import AnalyzeDocumentRequest
from azure.core.credentials import AzureKeyCredential
import base64, json, os, sys
from dotenv import load_dotenv

# Load environment variables from a .env file
load_dotenv()

endpoint = os.environ["AZURE_DI_ENDPOINT"]
key = os.environ["AZURE_DI_KEY"]

# Get filename from command line argument
if len(sys.argv) < 3:
    print("Usage: python run.py <pdf_file_path> <number_of_runs>")
    sys.exit(1)

filename = os.path.join("./docs", sys.argv[1])
num_runs = int(sys.argv[2])

client = DocumentIntelligenceClient(endpoint, AzureKeyCredential(key))

with open(filename, "rb") as f:
    b64 = base64.b64encode(f.read()).decode("utf-8")

for i in range(num_runs):
    print(f"\n=== Run {i + 1} of {num_runs} ===")
    poller = client.begin_analyze_document(
        model_id="prebuilt-invoice",
        body={"base64Source": b64},
    )

    result = poller.result()
    print(json.dumps(result.as_dict(), indent=2))
