# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cbnu_msgs: 6 messages, 0 services")

set(MSG_I_FLAGS "-Icbnu_msgs:/home/gn/gn_ws/src/platoon/cbnu_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cbnu_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" "cbnu_msgs/AnObjectData:std_msgs/Header"
)

get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" ""
)

get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" ""
)

get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" ""
)

get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" ""
)

get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_custom_target(_cbnu_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cbnu_msgs" "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg"
  "${MSG_I_FLAGS}"
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_cpp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(cbnu_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cbnu_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cbnu_msgs_generate_messages cbnu_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_cpp _cbnu_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cbnu_msgs_gencpp)
add_dependencies(cbnu_msgs_gencpp cbnu_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cbnu_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg"
  "${MSG_I_FLAGS}"
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_eus(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(cbnu_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cbnu_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cbnu_msgs_generate_messages cbnu_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_eus _cbnu_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cbnu_msgs_geneus)
add_dependencies(cbnu_msgs_geneus cbnu_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cbnu_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg"
  "${MSG_I_FLAGS}"
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_lisp(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(cbnu_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cbnu_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cbnu_msgs_generate_messages cbnu_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_lisp _cbnu_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cbnu_msgs_genlisp)
add_dependencies(cbnu_msgs_genlisp cbnu_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cbnu_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg"
  "${MSG_I_FLAGS}"
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_nodejs(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(cbnu_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cbnu_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cbnu_msgs_generate_messages cbnu_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_nodejs _cbnu_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cbnu_msgs_gennodejs)
add_dependencies(cbnu_msgs_gennodejs cbnu_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cbnu_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg"
  "${MSG_I_FLAGS}"
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)
_generate_msg_py(cbnu_msgs
  "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(cbnu_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cbnu_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cbnu_msgs_generate_messages cbnu_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AllObjectsData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/AnObjectData.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/Gps.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleCmd.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/VehicleTlm.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gn/gn_ws/src/platoon/cbnu_msgs/msg/MultiScenarioLoad.msg" NAME_WE)
add_dependencies(cbnu_msgs_generate_messages_py _cbnu_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cbnu_msgs_genpy)
add_dependencies(cbnu_msgs_genpy cbnu_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cbnu_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cbnu_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cbnu_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cbnu_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cbnu_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cbnu_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cbnu_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cbnu_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cbnu_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cbnu_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cbnu_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
