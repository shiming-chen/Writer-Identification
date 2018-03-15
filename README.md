# Writer-Identification

The  project - Semi-supervised Learning for improving Writer Identification and Retrieval
![](https://github.com/KiM55/Writer-Identification/blob/master/image1.png) 
                  

This main contributions:
1. This pipeline for writer identification will improve the generalization of model.
2. The generated unlabeled data will regularize the model. 
3. This model will improve the mAP and hard-Top-n of your data. 



# 1. First stage
This tage will segment the image to line refer to the paper <A Statistical approach to line segmentation in handwritten documents>

      

# 2. Second stage
This stage will generate new image with DCGAN
# Train
python main.py --dataset=[dataname] --train --input_height=256 --output_height=256 --options=1
# Test
python main.py --dataset=[dataname] --options=5  --output_path=[output_path] --sample_size=8000  --input_height=256 --output_height=256
# Notice
Before training,you should take your dataset in the 'data' direction.

![](https://github.com/KiM55/Writer-Identification/blob/master/image/d_loss.png)
![](https://github.com/KiM55/Writer-Identification/blob/master/image/g_loss.png)
![](https://github.com/KiM55/Writer-Identification/blob/master/image/d_loss_real.png)
![](https://github.com/KiM55/Writer-Identification/blob/master/image/d_loss_fake.png)

# 3. Third stage
This stage is to combine the original data and generated data to train the resnet_52 network.We used the code provided in https://github.com/layumi/Person-reID_GAN and modify the loss function and some hyper-parameters. 

# Notice
Before train your network,your should configure the matconvnet to your matlab. The concrete steps refer to http://www.vlfeat.org/matconvnet/install/

# Training
1. Add your dataset path into prepare_data.m and run it. Make sure the code outputs the right image path.
2. Run train_id_net_res_market_new.m.
3. Add your generated data path into prepare_data_gan.m and run it. It will add generated image path into the original image database.
4. Run train_id_net_res_market_lsro.m for training the proposed method.

#Testing
1. Run test/test_gallery_query_crazy.m to extract the features of images in the gallery and query set. They will store in a .mat file. Then you can use it to do evaluation.
2. Evaluate feature on your dataset. Run evaluation/WI_evaluation_res_faster.m or evaluation/WI_evaluation_res_fast.m.

![](https://github.com/KiM55/Writer-Identification/blob/master/train.png)
