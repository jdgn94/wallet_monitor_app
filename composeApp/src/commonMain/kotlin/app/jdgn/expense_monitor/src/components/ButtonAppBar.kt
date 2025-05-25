package app.jdgn.expense_monitor.src.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.unit.dp
import org.jetbrains.compose.resources.DrawableResource
import org.jetbrains.compose.resources.painterResource

@Composable
fun ButtonAppBar(
    onClick: () -> Unit,
    text: String = "",
    icon: DrawableResource,
    iconOnSelected: DrawableResource,
    selected: Boolean = false,
) {
    val screenWidth = LocalConfiguration.current.screenWidthDp.dp
    val defaultWidth = 80.dp
    val targetWidth = if (selected) (screenWidth - defaultWidth * 3) else defaultWidth // Adjusted for potentially smaller unselected size

    // Animate the width of the Box
    val animatedWidth by animateDpAsState(
        targetValue = targetWidth,
        animationSpec = tween(durationMillis = 300), label = "widthAnimation"
    )

    // Animate background color (optional, but nice touch)
    val animatedBackgroundColor by androidx.compose.animation.animateColorAsState(
        targetValue = if (selected) MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.7f) else Color.Transparent,
        animationSpec = tween(durationMillis = 300), label = "backgroundColorAnimation"
    )

    Box(
        Modifier
            .height(70.dp) // Keep height constant or animate it as well if needed
            .width(animatedWidth)
            .clip(MaterialTheme.shapes.medium)
            .clickable(onClick = onClick)
            .background(animatedBackgroundColor)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth() // Column will fill the animated width of the Box
                .height(70.dp),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                painter = painterResource(
                    if (selected) iconOnSelected else icon
                ),
                contentDescription = text.ifEmpty { "Icon" }, // Provide content description
                modifier = Modifier.size(25.dp),
                tint =
                    if (selected)
                        MaterialTheme.colorScheme.primary
                    else
                        MaterialTheme.colorScheme.onBackground
            )
            // AnimatedVisibility for the text
            AnimatedVisibility(
                visible = selected,
                enter = fadeIn(animationSpec = tween(delayMillis = 150)) + slideInHorizontally(animationSpec = tween(delayMillis = 150), initialOffsetX = { it / 2 }),
                exit = fadeOut(animationSpec = tween(durationMillis = 150)) + slideOutHorizontally(animationSpec = tween(durationMillis = 150), targetOffsetX = { it / 2 })
            ) {
                Text(
                    text = text,
                    color = MaterialTheme.colorScheme.primary, // Text is only visible when selected, so always primary color
                    style = MaterialTheme.typography.labelMedium, // Consider a smaller style for app bar text
                    maxLines = 1 // Ensure text doesn't wrap unexpectedly
                )
            }
        }
    }
}