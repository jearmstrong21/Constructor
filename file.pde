
void saveFileSelected(File file) {
  if (file==null)return;
  println(file);
  curOpened=file.getAbsolutePath();
  saveJSONObject(toJSON(), file.getAbsolutePath()  );
}
void openFileSelected(File file) {
  if (file==null)return;
  println(file);
  curOpened=file.getAbsolutePath();
  fromJSON(loadJSONObject(file.getAbsolutePath()));
}