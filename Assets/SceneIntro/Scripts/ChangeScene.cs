using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    public void LoadScene(string name) {
//        Debug.Log("Scene : " + name);
        SceneManager.LoadScene(name);
    }
    public void ExitGame()
    {
  //      Debug.Log("Quit!");
        Application.Quit(); //The Application.Quit call is ignored in the Editor.
    }
}
