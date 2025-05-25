package app.jdgn.expense_monitor.src.components

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun CustomListSubTitle(text: String) {
    Box(
        modifier = Modifier.padding(horizontal = 16.dp)
    ) {
        Text(
            text,
            color = MaterialTheme.colorScheme.primary, // Text is only visible when selected, so always primary color
            style = MaterialTheme.typography.labelMedium, // Consider a smaller style for app bar text
            fontWeight = MaterialTheme.typography.labelMedium.fontWeight,
        )
    }
}