package app.jdgn.expense_monitor.src.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.unit.dp
import org.jetbrains.compose.resources.DrawableResource
import org.jetbrains.compose.resources.StringResource
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.resources.stringResource

enum class CustomListItemOption {
    NONE,
    SWITCH,
    ARROW,
    CHIP
}

@Composable
fun CustomListItem(
    icon: DrawableResource,
    title: String = "No Title",
    titleResource: StringResource? = null,
    subTitle: String = "",
    subTitleResource: StringResource? = null,
    extraItem: CustomListItemOption = CustomListItemOption.NONE,
    onClick: () -> Unit = {}
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {

        Box(
            modifier = Modifier
                .fillMaxWidth()
                .border(
                    width = 2.dp,
                    color = MaterialTheme.colorScheme.primary,
                    shape = MaterialTheme.shapes.medium
                )
                .clip(shape = MaterialTheme.shapes.medium)
                .clickable(onClick = onClick)
                .padding(all = 16.dp)
        ) {
            Row (
                modifier = Modifier
                    .fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Start,
            ) {
                Icon(
                    painter = painterResource(icon),
                    contentDescription = null,
                    modifier = Modifier.size(25.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(Modifier.width(5.dp))
                Column(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.Center,
                    horizontalAlignment = Alignment.Start
                ) {
                    Text(
                        text =
                            if (titleResource != null)
                                stringResource(titleResource)
                            else
                                title,
                        color = MaterialTheme.colorScheme.primary, // Text is only visible when selected, so always primary color
                        style = MaterialTheme.typography.labelLarge, // Consider a smaller style for app bar text
                        fontSize = MaterialTheme.typography.labelLarge.fontSize,
                        maxLines = 1 // Ensure text doesn't wrap unexpectedly
                    )
                    if (subTitle.isNotEmpty() || subTitleResource != null) {
                        Spacer(Modifier.height(10.dp))
                        Text(
                            text =
                                if (subTitleResource != null)
                                    stringResource(subTitleResource)
                                else
                                    subTitle,
                            color = MaterialTheme.colorScheme.primary, // Text is only visible when selected, so always primary color
                            style = MaterialTheme.typography.labelMedium, // Consider a smaller style for app bar text
                            maxLines = 2 // Ensure text doesn't wrap unexpectedly
                        )
                    }
                }
                if (extraItem == CustomListItemOption.SWITCH) {
                    CustomListItemSwitch()
                }
                if (extraItem == CustomListItemOption.ARROW) {
                    CustomListItemArrow()
                }
                if (extraItem == CustomListItemOption.CHIP) {
                    CustomListItemChip()
                }
            }
        }
    }
}

@Composable
private fun CustomListItemSwitch() {}

@Composable
private fun CustomListItemArrow() {}

@Composable
private fun CustomListItemChip() {}