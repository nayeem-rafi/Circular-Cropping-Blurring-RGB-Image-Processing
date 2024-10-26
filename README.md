# Image Circular Cropping and Blurring with Gaussian Filter (RGB Retention)
By [Naimur Rahman](https://github.com/nayeem-rafi)  
## [Click for Files](https://drive.google.com/drive/folders/1dp9iFY21jg6EAYJg__i7AvckPHhJFcXR?usp=drive_link)

### Introduction  
This MATLAB project demonstrates how to interactively crop a circular portion of an image and apply a Gaussian blur filter to the cropped region while retaining its color information. It showcases practical image processing techniques such as cropping, filtering, and color-preserving channel manipulation.

### Description  
This MATLAB script allows users to crop an image in a circular region and apply a Gaussian blur to that area while preserving the RGB color channels. The user selects the center and edge of the circular region interactively. A Gaussian filter is applied to blur the selected area, and the final image with the blurred circular crop is displayed.

### Objective  
The primary goals of this project are to:  
- Allow the user to select a circular area of an image.
- Apply a Gaussian blur filter to the selected circular section of the image.
- Display the modified image with the blurred circular area while maintaining the RGB color.

### Analyzing the Input  
The input image (`davis_hall_building.jpeg`) is read from the current directory. Users are prompted to manually select the center and edge of the circular area they want to crop by clicking on the image.

### Blurring with Cropping  
#### Cropping  
The user selects the center of the circular area and then clicks on the edge to define the radius of the crop. The coordinates are stored for later manipulation.

#### Gaussian Blur  
A Gaussian filter is applied to the circular region of the image while maintaining RGB color. The key parameters of the filter include:  
- **Kernel size (`hsize`)**: Determines the size of the filter matrix (set to 21 in this case).
- **Standard deviation (`sigma`)**: Controls the amount of blur (set to 10).

The filter is applied separately to each color channel (red, green, and blue) using the `imfilter()` function, ensuring that the blur effect is consistent across the image's RGB components without converting to grayscale.

---

<h1 align="center">  
**Select Center and Radius Edge**  
</h1>  
<p align="center">  
<img src="https://github.com/user-attachments/assets/ae09852d-574c-4a99-9e49-5872f8efd290", width="620">  
</p>  

<h1 align="center">  
**Circular Blurred Area with Color**  
</h1>  
<p align="center">  
<img src="https://github.com/user-attachments/assets/8ea310b3-38e2-4bce-a305-512ae0c99ac5", width="620">  
</p>  

### How the Code Works  
1. The image is first loaded using `imread()`, and the user selects the center of the circular area and then the edge through mouse clicks.
2. A circular mask is created based on the user-defined center and radius.
3. A Gaussian filter is created using `fspecial()`, and a new blurred image is initialized.
4. The filter is applied to each of the three color channels (RGB) of the original image without altering the color.
5. The blurred circular region is merged back into the original image, replacing the selected area with the blurred version while retaining the color.
6. The final result is displayed using `imshow()`.

### How to Run the Code  
1. Ensure MATLAB is installed on your system.
2. Place the `davis_hall_building.jpeg` image in the same directory as your script.
3. Run the script. You will be prompted to select the center and edge of the circular area you want to crop and blur.
4. Once you confirm your selections, the Gaussian blur is applied, and the modified image is displayed.

#### Key steps:  
- Adjust the selection interactively.
- Define the Gaussian kernel parameters (`hsize` and `sigma`) if needed.
- Experiment with different values of the kernel size and sigma to observe the effect of blurring on the circular region while retaining color.

### Conclusion  
This project provides a simple, interactive way to crop and blur images in MATLAB. By selecting a circular region of interest and applying a Gaussian filter, users can quickly see the effects of image processing techniques. This approach is commonly used in image editing software to blur specific parts of an image, such as backgrounds, while preserving details in other regions.

Feel free to adjust the kernel size and standard deviation values to explore different levels of blurring and enhance your understanding of Gaussian filters in image processing.

--- 
