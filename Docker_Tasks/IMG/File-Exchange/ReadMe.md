# Report: File Exchange Display Error

## Problem description
When running the `halverneus/static-file-server` image, the browser returned an empty response (Empty Response), even though the container was in the `Up` state.

## Cause
The container was running in an empty directory. Unlike Nginx, this server does not generate a default stub page if there are no files in the root folder (`/srv`).

## Solution
Adding any file (for example, `success.txt`) to the host's working directory before mounting the volume resolves the issue.