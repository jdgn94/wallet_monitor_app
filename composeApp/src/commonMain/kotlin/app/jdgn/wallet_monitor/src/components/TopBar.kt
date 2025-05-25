package app.jdgn.expense_monitor.src.components

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import org.jetbrains.compose.resources.StringResource
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.arrow_left
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
                        painter = painterResource(Res.drawable.arrow_left),
                        contentDescription = "Back navigator" // Use stringResource
                    )
                }
            }
        }
    )
}
