





## Bit Plane Slicing

Author Name: Mann Manohar



## Description: 



The Bit Slicing Experiment Viewer is a MATLAB script designed to convert an image into its constituent bit planes and display each bit plane individually. This experiment helps in understanding how images are stored at the binary level and provides insights into the significance of each bit plane in forming the overall image.

The script processes a grayscale image and splits it into eight bit planes, each representing one bit of the image's pixel intensity values.



## Features

- Interactive File Selection: Allows the user to select an image file using a file selection dialog.
- Grayscale Image Processing: Automatically converts the input image to grayscale if it is in RGB format.
- Bit Plane Visualization: Extracts all 8 bit planes of the grayscale image and displays them in a 4x4 subplot layout for easy comparison.
- Enhanced Visibility: Scales the bits for better visual representation of the bit planes.




## How to run

1. Open the MATLAB environment.

2. Save the provided script as BitSlicingExperiment.m.

3. Run the script.

4. A file selection dialog will appear. Select an image file.

5. The grayscale version of the image and its bit planes will be displayed in separate figure windows.
    
## Example Output

Below is an example output of the application after loading an image:

- Grayscale Image: The input image is displayed in grayscale in the first figure window.

- Bit Planes: Bit planes 1 to 8 are displayed in the first eight subplots.



## Supported Image Formats

- .jpg

- .jpeg

- .png

- .bmp


## Notes

- Ensure that the selected image file is compatible with the supported formats.

- The script uses a file selection dialog to choose the image. If the user cancels the selection, the script will exit gracefully.

- Bit planes are scaled for enhanced visibility, but this does not affect their binary values.

