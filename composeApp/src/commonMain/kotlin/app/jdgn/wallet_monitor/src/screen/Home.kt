import androidx.compose.animation.AnimatedContent
import androidx.compose.animation.ExperimentalAnimationApi
import androidx.compose.animation.SizeTransform
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import android.app.Activity
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.wallet_monitor.src.components.BottomBar
import app.jdgn.wallet_monitor.src.components.TopBar
import androidx.activity.compose.BackHandler
import androidx.compose.material3.ButtonDefaults
import org.jetbrains.compose.resources.stringResource
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.app_name
import walletmonitor.composeapp.generated.resources.confirm_exit
import walletmonitor.composeapp.generated.resources.confirm_exit_message
import walletmonitor.composeapp.generated.resources.no
import walletmonitor.composeapp.generated.resources.yes

@OptIn(ExperimentalAnimationApi::class) // Required for AnimatedContent
@Composable
fun HomeScreen(
    navController: NavHostController = rememberNavController(),
) {
    var tabSelector: Int by rememberSaveable { mutableStateOf(0) }
    var showDialog by remember { mutableStateOf(false) }

    val context = LocalContext.current
    val activity = context as? Activity


    fun changeTab(index: Int) {
        tabSelector = index
    }

    if (showDialog) {
        AlertDialog(
            onDismissRequest = { showDialog = false },
            title = { Text(stringResource(Res.string.confirm_exit)) },
            text = { Text(stringResource(Res.string.confirm_exit_message)) },
            confirmButton = {
                Button(
                    onClick = {
                    showDialog = false
                    // Close the app
                    activity?.finishAffinity() // Or activity?.finish()
                    },
                    colors = ButtonDefaults.buttonColors(
                        containerColor = androidx.compose.material3.MaterialTheme.colorScheme.error
                    )
                ) {
                    Text(stringResource(Res.string.yes))
                }
            },
            dismissButton = {
                Button(onClick = { showDialog = false }) {
                    Text(stringResource(Res.string.no))
                }
            }
        )
    }

    // Intercept back press if not on the first tab
    // The BackHandler is enabled only when tabSelector is not 0
    BackHandler(enabled = true) {
        // When back is pressed and we are not on tab 0, go to tab 0
        if (tabSelector != 0) {
            changeTab(0)
        } else {
            // If we are on tab 0, show the dialog
            showDialog = true
        }
    }


    Scaffold(
        topBar = { TopBar(resourceTitle = Res.string.app_name) },
        bottomBar = {
            BottomBar(
                onChange = { newIndex -> changeTab(newIndex) },
                index = tabSelector
            )
        }
    ) { innerPadding ->
        AnimatedContent(
            targetState = tabSelector,
            modifier = Modifier
                .padding(innerPadding)
                .fillMaxSize(),
            transitionSpec = {
                val enterTransition = if (targetState > initialState) {
                    slideInHorizontally { height -> height } + fadeIn()
                } else {
                    slideInHorizontally { height -> -height } + fadeIn()
                }

                val exitTransition = if (targetState > initialState) {
                    slideOutHorizontally { height -> -height } + fadeOut()
                } else {
                    slideOutHorizontally { height -> height } + fadeOut()
                }

                enterTransition.togetherWith(exitTransition).using(
                    SizeTransform(clip = false)
                )
            },
            label = "TabContentAnimation" // Optional label for debugging
        ) { targetSelectedTab ->
            Box(modifier = Modifier.fillMaxSize()) {
                when (targetSelectedTab) {
                    0 -> Home.Content()
                    1 -> Budgets.Content()
                    2 -> Transactions.Content()
                    3 -> More.Content(navController)
                    else -> Home.Content() // Default case
                }
            }
        }
    }
}
