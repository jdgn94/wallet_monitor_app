package app.jdgn.expense_monitor.src.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.BottomAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.chart
import walletmonitor.composeapp.generated.resources.chart_multiple_filled
import walletmonitor.composeapp.generated.resources.chart_multiple_regular
import walletmonitor.composeapp.generated.resources.home
import walletmonitor.composeapp.generated.resources.home_filled
import walletmonitor.composeapp.generated.resources.home_more_filled
import walletmonitor.composeapp.generated.resources.home_more_regular
import walletmonitor.composeapp.generated.resources.home_regular
import walletmonitor.composeapp.generated.resources.money_filled
import walletmonitor.composeapp.generated.resources.money_regular
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
                icon = Res.drawable.home_regular,
                iconOnSelected = Res.drawable.home_filled,
                selected = index == 0
            )
            ButtonAppBar(
                onClick = { onChange(1) },
                textResource = Res.string.transactions,
                icon = Res.drawable.money_regular,
                iconOnSelected = Res.drawable.money_filled,
                selected = index == 1
            )
            ButtonAppBar(
                onClick = { onChange(2) },
                textResource = Res.string.chart,
                icon = Res.drawable.chart_multiple_regular,
                iconOnSelected = Res.drawable.chart_multiple_filled,
                selected = index == 2
            )
            ButtonAppBar(
                onClick = { onChange(3) },
                textResource = Res.string.more,
                icon = Res.drawable.home_more_regular,
                iconOnSelected = Res.drawable.home_more_filled,
                selected = index == 3
            )
        }
    }
}