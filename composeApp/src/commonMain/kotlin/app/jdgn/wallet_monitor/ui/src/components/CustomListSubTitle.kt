package app.jdgn.wallet_monitor.ui.src.components

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import org.jetbrains.compose.resources.StringResource
import org.jetbrains.compose.resources.stringResource
import org.jetbrains.compose.ui.tooling.preview.Preview

@Preview
@Composable
fun CustomListSubTitle(
    text: String = "No title",
    textResource: StringResource? = null
) {
    Box(
        modifier = Modifier.padding(horizontal = 16.dp)
    ) {
        Text(
            text =
                if (textResource != null)
                    stringResource(textResource)
                else
                    text,
            color = MaterialTheme.colorScheme.primary, // Text is only visible when selected, so always primary color
            style = MaterialTheme.typography.labelMedium, // Consider a smaller style for app bar text
            fontWeight = MaterialTheme.typography.labelMedium.fontWeight,
        )
    }
}