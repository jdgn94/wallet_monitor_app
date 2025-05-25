package app.jdgn.wallet_monitor.src.screen

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.wallet_monitor.src.components.TopBar
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.accounts

@Composable
fun Accounts(navController: NavHostController = rememberNavController()) {
    val scrollState = rememberScrollState()

    Scaffold(
        topBar = { TopBar(
            goBack = true,
            resourceTitle = Res.string.accounts,
            navController = navController
        ) }
    ) {
        Column(
            modifier = Modifier
                .padding(it)
                .verticalScroll(scrollState)
        ) {  }
    }
}