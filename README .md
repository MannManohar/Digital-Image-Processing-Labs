





## Histogram Equalization Viewer

Author Name: Mann Manohar



## Description: 



The Histogram Equalization Viewer is a MATLAB script designed to perform histogram equalization on an image. This technique improves the contrast of the image by spreading out the most frequent intensity values. The application provides an interactive visualization of the original and equalized images, along with their histograms and cumulative distribution functions (CDFs).



## Features

- Interactive Visualization: Displays the original grayscale image, its histogram, and CDF, alongside the equalized image with its corresponding histogram and CDF in a 2x3 subplot layout.
- Histogram Equalization: Enhances the contrast of the image using MATLAB's built-in histeq function.




## How to run

1. Open the MATLAB environment.

2. Save the provided script as HistogramEqualizationViewer.m.

3. Run the script.

4. A file selection dialog will appear. Select an image file.

5. The original grayscale image, histogram, CDF, and their equalized versions will be displayed in separate subplots.
    
## Example Output

Below is an example output of the application after loading an image:

 (histogram_01.png)

- The original grayscale image is displayed in the first subplot.

- The original histogram is displayed in the second subplot.

- The original CDF is displayed in the third subplot.

- The histogram equalized image is displayed in the fourth subplot.

- The equalized histogram is displayed in the fifth subplot.

- The equalized CDF is displayed in the sixth subplot.


## Supported Image Formats

- .jpg

- .jpeg

- .png

- .bmp


## Notes

- Ensure that the selected image file is compatible with the supported formats.

- The script uses a file selection dialog to choose the image. If the user cancels the selection, the script will exit gracefully.

- The script displays the images and their histograms in a consistent 2x3 subplot layout for easy comparison.

