# Writer-Identification
The  project - The off-line writer identification whth deep neural network
![](https://github.com/KiM55/Writer-Identification/blob/master/image1.png) 
                        The model structure

This main contributions:
1. This pipeline for writer identification will improve the generalization of model.
2. The generated unlabeled data will regularize the model. 



# First stage
This tage will segment the image to line

![](https://github.com/KiM55/Test/blob/master/origin%20image.png) 
                          The origin image

![](https://github.com/KiM55/Test/blob/master/The%20segmented%20image.png)
                          The segmented image

# Second stage
This stage will generate new image with DCGAN
![](https://github.com/KiM55/Test/blob/master/d_loss.png)
![](https://github.com/KiM55/Test/blob/master/g_loss.png)
![](https://github.com/KiM55/Test/blob/master/d_loss_fake.png)
![](https://github.com/KiM55/Test/blob/master/d_loss_real.png)
