# Knowledge Article Search Component

This Lightning Web Component (LWC) is designed for Salesforce to help users easily search and view Knowledge Articles. It provides a streamlined interface for searching Knowledge Articles by keywords, categories, or other filters, and displays the relevant articles in a user-friendly list format.


## Features

- Keyword Search: Users can search Knowledge Articles by entering keywords.
- Category Filtering: Filter results by specified categories.
- Article Details View: Click on an article to view more details.
- Pagination: Navigate through multiple pages of search results for efficient browsing.
- Responsive Design: Adapts to both desktop and mobile screens.

## Configuration

- Knowledge Object: Ensure that Knowledge is enabled in your Salesforce org.
- Permission Setup: Users should have permission to read Knowledge Articles.      

## Usage

### 1. Usage in Field Service Mobile App

Open the Salesforce FSL Mobile App on your mobile device. Then navigate to the list of Service Appointments assigned to you. select the specific Service Appointment you are currently working on.

####  Accessing the Service Appointment:
Open the Salesforce FSL Mobile App on your mobile device. Then navigate to the list of Service Appointments assigned to you. select the specific Service Appointment you are currently working on.

<img src="https://github.com/user-attachments/assets/1dd7b6e0-6971-4383-bceb-c6d1eb99751f" height=600 width=500  />

#### Opening the Knowledge Search Component:

Within the Service Appointment record page, navigate to the <b> Knowledge Search</b> embedded within the Action.


<img src="https://github.com/user-attachments/assets/a5eb9a27-f03d-46bb-a9ca-0b026618503d" height=600 width=500  />

#### Fetching Knowledge Article 

Based On your search result article will populate.

<img src="https://github.com/user-attachments/assets/d49731cc-1de1-4359-b32c-8b5d807142f8" height=600 width=500  />

Select the article you want to view to see detailed information. If the selected article contains any attached documents, they will also be displayed, and you can click 'Download' to download the article's attachments.

<img src="https://github.com/user-attachments/assets/be060353-986c-45e1-9ce8-f7958fc237ea" height=600 width=500  />

### 2. Enable Public Access on Experience Site

To make the Knowledge Article Search Component accessible to users without requiring login on an Experience Site:

#### Mark Articles as Publicly Visible:

- Go to each Knowledge Article you want to make public.
- Set the article’s visibility to "Public" so it can be accessed without login.

<img src="https://github.com/user-attachments/assets/b369d4e3-b7a8-4d5e-b186-91c2fa32afd8" height=600 width=1000  />

as well you able to download the article attachments

<img src="https://github.com/user-attachments/assets/e03c46a0-7c2a-41ce-b72a-78418d493b27"   />




