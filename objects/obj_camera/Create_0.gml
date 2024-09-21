/// @description initialize

//inital values
cam = camera_create();
viewportWidth = 1280;//1760 880
viewportHeight = 720;//990 495

camWidth = viewportWidth;
camHeight = viewportHeight;
zoom = 1;

aspectRatio = display_get_width() / display_get_height();
surface_resize(application_surface, camWidth, camHeight);
window_set_size(viewportWidth, viewportHeight);

var viewMat = matrix_build_lookat(x, y, -10000, x, y, 0, 0, 1, 0);
var projMat = matrix_build_projection_ortho(camWidth * zoom, camHeight * zoom, 1.0, 30000.0);

camera_set_view_mat(cam, viewMat);
camera_set_proj_mat(cam, projMat);

view_camera[0] = cam;

camera = id;