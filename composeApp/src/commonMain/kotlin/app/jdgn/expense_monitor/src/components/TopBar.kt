package app.jdgn.expense_monitor.src.components

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.arrow_left
import walletmonitor.composeapp.generated.resources.line_horizontal_3_filled
import org.jetbrains.compose.resources.painterResource

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TopBar(
    title: String,
    goBack: Boolean = false,
    navController: NavHostController = rememberNavController()
) {
    TopAppBar(
        title = { Text(title) },
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
