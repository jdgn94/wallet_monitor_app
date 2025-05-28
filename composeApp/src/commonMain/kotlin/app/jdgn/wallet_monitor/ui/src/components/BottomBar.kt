package app.jdgn.wallet_monitor.ui.src.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.BottomAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import app.jdgn.wallet_monitor.ui.Resources
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.chart
import walletmonitor.composeapp.generated.resources.home
import walletmonitor.composeapp.generated.resources.more
import walletmonitor.composeapp.generated.resources.transactions

@Composable
fun BottomBar(onChange: (Int) -> Unit, index: Int = 0) {
    BottomAppBar(
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            ButtonAppBar(
                onClick = { onChange(0) },
                textResource = Res.string.home,
                icon = Resources.Icons.App.home,
                iconOnSelected = Resources.Icons.App.home_filled,
                selected = index == 0
            )
            ButtonAppBar(
                onClick = { onChange(1) },
                textResource = Res.string.transactions,
                icon = Resources.Icons.App.money,
                iconOnSelected = Resources.Icons.App.money_filled,
                selected = index == 1
            )
            ButtonAppBar(
                onClick = { onChange(2) },
                textResource = Res.string.chart,
                icon = Resources.Icons.App.chart_multiple,
                iconOnSelected = Resources.Icons.App.chart_multiple_filled,
                selected = index == 2
            )
            ButtonAppBar(
                onClick = { onChange(3) },
                textResource = Res.string.more,
                icon = Resources.Icons.App.home_more,
                iconOnSelected = Resources.Icons.App.home_more_filled,
                selected = index == 3
            )
        }
    }
}