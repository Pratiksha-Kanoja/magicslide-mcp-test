# MagicSlides MCP Server

[![smithery badge](https://smithery.ai/badge/@Pratiksha-Kanoja/magicslide-mcp-test)](https://smithery.ai/server/@Pratiksha-Kanoja/magicslide-mcp-test)

A server that implements the Model Context Protocol (MCP) to generate PowerPoint presentations from text, YouTube videos, or structured JSON data.

## Overview

MagicSlides MCP Server allows AI assistants to generate professional PowerPoint presentations on any topic. The server provides tools for creating presentations from plain text descriptions, YouTube video transcripts, or structured JSON presentations.

## Features

- Generate PowerPoint presentations from:
  - Plain text descriptions
  - YouTube video transcripts (automatically extracted)
  - Structured JSON presentation definitions
- Customize presentations with:
  - Slide count
  - Image inclusion (Google or AI-generated)
  - Language selection
  - Template selection
  - Multiple model options (GPT-4, GPT-3.5, Gemini, Claude)
- Account management and plan validation
- Both PPT and PDF output formats

## Tools

The server exposes the following tools via the MCP protocol:

| Tool Name | Description |
|-----------|-------------|
| `create_ppt_from_text` | Generate a PowerPoint from text or YouTube URL |
| `get_youtube_transcript` | Fetch transcript from a YouTube video URL |
| `generate_presentation_json` | Generate a presentation JSON structure from a topic |
| `create_ppt_from_json` | Generate a PowerPoint from a presentation JSON structure |

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn

### Installing via Smithery

To install magicslide-mcp-test automatically via [Smithery](https://smithery.ai/server/@Pratiksha-Kanoja/magicslide-mcp-test):

```bash
npx -y @smithery/cli install @Pratiksha-Kanoja/magicslide-mcp-test
```

### Installation

1. Clone this repository
2. Install dependencies:
   ```
   npm install
   ```

### Configuration

The server can be configured to use different API endpoints:

- `MAGICSLIDES_API_URL`: API for creating PowerPoint presentations
- `ACCOUNT_INFO_API_URL`: API for fetching account information (specially for email and plan fetching)
- `YOUTUBE_TRANSCRIPT_API_URL`: API for fetching YouTube transcripts 
- `SLIDE_GENERATION_DATA_API_URL`: API for fetching slide generation data(generating json)

### Running the Server 

```
npm start 
```

### Using with Claude Desktop
1. Make sure you have Claude Desktop installed and running
2. Configure Claude Desktop to use this MCP server
   - Open settings of claude desktop
   - click on developer > MCP server > Edit config
   - paste the following config in "claude_desktop_config.json" file:
   ```
        { 
   "mcpServers": {
     "magicslide-mcp": {
       "command": "npx",
       "args": [
         "-y",
         "@smithery/cli@latest",
         "run",
         "@IndianAppGuy/magicslide-mcp",
         "--key",
         "34767b34-2653-4cd7-8454-58c9e95d20b5"
       ]
     }
    }
   }

 - click on save

3. You can then use the provided tools to interact with Magic Slides AI services
 - create_ppt_from_text
  Example: "I wanted to create presentation contain 5 slides on topic artificial intelligence. i want google images include ,used gpt-4 model, use template bullet-point2, my account_id: ACCOUNT_ID"
 - create_ppt_from_youtubeURL
  Example: "i wanted to create presentation contain 5 slides on https://youtu.be/aO1-6X_f74M?si=4svf4F7KKG6KivCp. i want google images include ,used gpt-4 model, use template bullet-point2, my account_id: ACCOUNT_ID"


