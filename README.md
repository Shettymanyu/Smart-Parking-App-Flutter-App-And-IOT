# car_parking_system

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


python - https://youtu.be/UrsmFxEIp5k?si=Xiy9XjGmjLWojhuI


https://youtu.be/PXMJ6FS7llk?si=tdXhHkO-Ly1S4hiK.  free code camp

python mosh - https://youtu.be/_uQrJ0TkZlc?si=5zsH7-HT7pDy1E11



AI Chatbot Build - https://youtu.be/SWP3k-24jT4?si=dhdkHtJGxnbyjNZt


chatgpt - https://chatgpt.com

youtube - https://www.youtube.com/

links - for auto form fill

1. https://youtu.be/YbGAUEjTKg4?si=5EA1ybt2CQMznQ-S
2. https://youtu.be/kVFcE4M6lw0?si=yeBbe7R_g_OMe7qS
3. https://youtu.be/BvU7qfdrqjc?si=oQ2po6aq8T7EU8ew

samay - https://youtu.be/lr1L_xUKB1E?si=WisPXrGfvbf_LNjl



https://www.youtube.com/watch?v=y8zY14HHiPI&list=PLP5_A7hnY1Tggph0F0cRqf5iyyZuIBXYC


https://youtu.be/y8zY14HHiPI?si=FsO-CAwOMLvObjZo


playwright - https://youtube.com/playlist?list=PLhW3qG5bs-L9sJKoT1LC5grGT77sfW0Z8&si=_Gm5SR7k1ijU6mCf

https://youtu.be/HXV3zeQKqGY?si=EbEwrV94pOxvtA1a


https://youtu.be/B8nIt0TCJik?si=TxxFBF16UzcLUbVl


https://youtu.be/1PCWwK0AsE0?si=w8IOJnTBqjtCXhpf


Web automation - https://youtube.com/playlist?list=PLRzwgpycm-FiTz9bGQoITAzFEOJkbF6Qp&si=kDl11XDzGXspIter




https://youtu.be/QM5XDc4NQJo?si=4dAuj7MVwUBbA-SY

https://youtu.be/t0EzVCvQjGE?si=rcC_17U83m-7g72W


https://youtu.be/Nyw922bqYAQ?si=PIT6yhmDWPYPMFeD







from playwright.sync_api import Playwright, sync_playwright

def export_csv_report(url):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto(url)

        # Locate the "CSV file format" radio button and click it
        csv_button = page.locator("text=CSV file format")
        csv_button.click()

        # Locate and click the "Export" button
        export_button = page.locator("text=Export")
        export_button.click()

        # Wait for the export process to complete (adjust timeout as needed)
        page.wait_for_timeout(5000)

        browser.close()

if __name__ == "__main__":
    url = "https://your_queue_outline_report_url"  # Replace with the actual URL
    export_csv_report(url)



https://youtu.be/hlGoQC332VM?si=ZIu39Zvfq0Kdzaau






https://youtu.be/3mukGYjvixE?si=MhnM5dGtEfY931rl



