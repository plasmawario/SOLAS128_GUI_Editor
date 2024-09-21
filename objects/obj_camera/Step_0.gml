/// @description h

var viewMat = matrix_build_lookat(x, y, -10000, x, y, 0, 0, 1, 0);
var projMat = matrix_build_projection_ortho(camWidth * zoom, camHeight * zoom, 1.0, 30000.0);

camera_set_view_mat(cam, viewMat);
camera_set_proj_mat(cam, projMat);

view_camera[0] = cam;