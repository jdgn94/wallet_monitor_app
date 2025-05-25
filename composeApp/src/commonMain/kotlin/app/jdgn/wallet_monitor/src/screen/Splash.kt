package app.jdgn.wallet_monitor.src.screen

import HomeScreen
import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.app_icon
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import org.jetbrains.compose.resources.painterResource


@Composable
fun SplashScreen(navController: NavHostController) {
    val scale = remember { Animatable(1f) } // Initial scale

    LaunchedEffect(Unit) {
        // Start the scale animation (optional, but good for UX)
        launch { // Launch animation in a separate coroutine
            scale.animateTo(
                targetValue = 1.2f,
                animationSpec = infiniteRepeatable(
                    animation = tween(durationMillis = 1000, easing = LinearEasing),
                    repeatMode = RepeatMode.Reverse
                )
            )
        }

        // Delay for 2 seconds
        delay(2000L) // 2000 milliseconds = 2 seconds
        // Navigate to the next screen and clear the back stack
        navController.navigate("home") { // Replace "homeScreen" with your actual route
            popUpTo(navController.graph.startDestinationId) {
                inclusive = true
            }
        }
    }

    Scaffold {
        Box(
            Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Image(
                painter = painterResource(Res.drawable.app_icon),
                contentDescription = "App Icon",
                modifier = Modifier.scale(scale.value).size(100.dp)
            )
        }
    }
}
