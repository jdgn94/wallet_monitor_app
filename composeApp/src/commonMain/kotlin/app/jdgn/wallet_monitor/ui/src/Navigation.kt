package app.jdgn.wallet_monitor.ui.src

import HomeScreen
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import app.jdgn.wallet_monitor.ui.src.screen.Accounts
import app.jdgn.wallet_monitor.ui.src.screen.SplashScreen
import app.jdgn.wallet_monitor.ui.src.utils.AppConstants

@Composable
fun Navigation(modifier:Modifier = Modifier) {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = "splash") {
        composable("splash") {
            SplashScreen(navController)
        }
        composable("home") {
            HomeScreen(
                navController = navController
            )
        }
        composable("accounts") {
            Accounts(
                navController = navController
            )
        }
    }
}

fun navigateTo(
    routeName: String,
    navController: NavController
) {
    when (routeName) {
        AppConstants.BACK_ROUTE.toString() -> {
            navController.popBackStack()
        }
        else -> {
            navController.navigate(routeName)
        }
    }
}