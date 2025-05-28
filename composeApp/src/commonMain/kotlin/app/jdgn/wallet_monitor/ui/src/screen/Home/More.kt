import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.wallet_monitor.CurrentPlatform
import app.jdgn.wallet_monitor.currentPlatform
import app.jdgn.wallet_monitor.ui.Resources
import app.jdgn.wallet_monitor.ui.src.components.CustomListItem
import app.jdgn.wallet_monitor.ui.src.components.CustomListSubTitle
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.about
import walletmonitor.composeapp.generated.resources.accounts
import walletmonitor.composeapp.generated.resources.biometric
import walletmonitor.composeapp.generated.resources.calendar
import walletmonitor.composeapp.generated.resources.expenses_income
import walletmonitor.composeapp.generated.resources.face_id
import walletmonitor.composeapp.generated.resources.feedback
import walletmonitor.composeapp.generated.resources.goal
import walletmonitor.composeapp.generated.resources.more
import walletmonitor.composeapp.generated.resources.movements
import walletmonitor.composeapp.generated.resources.persons
import walletmonitor.composeapp.generated.resources.pin
import walletmonitor.composeapp.generated.resources.security
import walletmonitor.composeapp.generated.resources.settings

object More {
    @Composable
    fun Content(navController: NavHostController = rememberNavController()) {
        val scrollState = rememberScrollState()

        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(scrollState),
            verticalArrangement = Arrangement.Top,
            horizontalAlignment = Alignment.Start
        ) {
            CustomListSubTitle(textResource = Res.string.movements)
            CustomListItem(
                icon = Resources.Icons.App.calendar,
                titleResource = Res.string.calendar,
            )
            CustomListItem(
                icon = Resources.Icons.App.piggy,
                titleResource = Res.string.goal,
            )
            CustomListItem(
                icon = Resources.Icons.App.arrow_up_down,
                titleResource = Res.string.expenses_income,
            )
            CustomListSubTitle(textResource = Res.string.accounts)
            CustomListItem(
                icon = Resources.Icons.App.bank,
                titleResource = Res.string.accounts,
                onClick = { navController.navigate("accounts") }
            )
            CustomListItem(
                icon = Resources.Icons.App.person,
                titleResource = Res.string.persons,
            )
            CustomListSubTitle(textResource = Res.string.security)
            CustomListItem(
                icon = Resources.Icons.App.password,
                titleResource = Res.string.pin,
            )
            CustomListItem(
                icon =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        Resources.Icons.App.fingerprint
                    else
                        Resources.Icons.App.face_id,
                titleResource =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        Res.string.biometric
                    else
                        Res.string.face_id,
            )
            CustomListSubTitle(textResource = Res.string.more)
            CustomListItem(
                icon = Resources.Icons.App.settings,
                titleResource = Res.string.settings,
            )
            CustomListItem(
                icon = Resources.Icons.App.info,
                titleResource = Res.string.about,
            )
            CustomListItem(
                icon = Resources.Icons.App.message,
                titleResource = Res.string.feedback,
            )
        }
    }
}