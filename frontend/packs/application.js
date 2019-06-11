import '../stylesheets/application.scss';
import '../javascripts/application';
import 'bootstrap'
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);
import Rails from 'rails-ujs'
Rails.start()
const images = require.context('../images/', true)
