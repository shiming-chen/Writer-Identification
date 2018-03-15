#include "LineSegmentation.hpp"

int main() {
    LineSegmentation line_segmentation("D:\\Writer identification\\data\\HistoricalWI_Query_binary_origin\\0005-IMG_MAX_998376.jpg");
    vector<cv::Mat> lines = line_segmentation.segment();
    // ToDo @Samir55 Remove.
    int idx = 0;
    for(auto m : lines) {
        imwrite("Line " + to_string(idx++) + ".jpg", m);
    }
    return 0;
}