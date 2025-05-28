package app.jdgn.wallet_monitor.ui.src.components

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.wallet_monitor.ui.Resources
import org.jetbrains.compose.resources.StringResource
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.resources.stringResource

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TopBar(
    title: String = "No title",
    resourceTitle: StringResource? = null,
    goBack: Boolean = false,
    navController: NavHostController = rememberNavController()
) {
    TopAppBar(
        title = { Text(
            if (resourceTitle == null)
                title
            else
                stringResource(resourceTitle)
        ) },
        navigationIcon = {
            if (goBack) {
                IconButton(onClick = { navController.popBackStack() }) {
                    Icon(
                        painter = painterResource(Resources.Icons.App.arrow_left),
                        contentDescription = "Back navigator" // Use stringResource
                    )
                }
            }
        }
    )
}
